import 'package:flutter/material.dart';
import 'package:memehub_client/memehub_client.dart';
import '../main.dart';
import 'meme_detail_sheet.dart';

/// 홈 화면 - 트렌딩/최신 짤 그리드
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Meme> _trendingMemes = [];
  List<Meme> _latestMemes = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadMemes();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _loadMemes() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final trending = await client.meme.getTrending(limit: 50, offset: 0);
      final latest = await client.meme.getLatest(limit: 50, offset: 0);

      setState(() {
        _trendingMemes = trending;
        _latestMemes = latest;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverToBoxAdapter(
              child: Container(
                color: AppColors.white,
                child: Column(
                  children: [
                    // Header
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      child: Row(
                        children: [
                          // Logo
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(
                              Icons.emoji_emotions_outlined,
                              color: AppColors.white,
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            'MemeHub',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: AppColors.gray900,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: _loadMemes,
                            icon: const Icon(Icons.refresh_outlined),
                            color: AppColors.gray600,
                          ),
                        ],
                      ),
                    ),
                    // Tab Bar
                    TabBar(
                      controller: _tabController,
                      indicatorColor: AppColors.primary,
                      indicatorWeight: 3,
                      labelColor: AppColors.primary,
                      unselectedLabelColor: AppColors.gray400,
                      labelStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                      unselectedLabelStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      dividerColor: AppColors.gray100,
                      tabs: const [
                        Tab(text: 'Trending'),
                        Tab(text: 'Latest'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
          body: TabBarView(
            controller: _tabController,
            children: [
              _buildMemeGrid(_trendingMemes),
              _buildMemeGrid(_latestMemes),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMemeGrid(List<Meme> memes) {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          color: AppColors.primary,
          strokeWidth: 2,
        ),
      );
    }

    if (_error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.cloud_off_outlined, size: 56, color: AppColors.gray400),
              const SizedBox(height: 16),
              Text(
                'Failed to load memes',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.gray600,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                _error!,
                style: TextStyle(fontSize: 14, color: AppColors.gray400),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              OutlinedButton.icon(
                onPressed: _loadMemes,
                icon: const Icon(Icons.refresh),
                label: const Text('Try Again'),
              ),
            ],
          ),
        ),
      );
    }

    if (memes.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.image_outlined, size: 64, color: AppColors.gray300),
              const SizedBox(height: 16),
              const Text(
                'No memes yet',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.gray600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Be the first to upload a meme!',
                style: TextStyle(fontSize: 14, color: AppColors.gray400),
              ),
            ],
          ),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _loadMemes,
      color: AppColors.primary,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1,
          ),
          itemCount: memes.length,
          itemBuilder: (context, index) {
            final meme = memes[index];
            return _MemeCard(
              meme: meme,
              onTap: () => _showMemeDetail(meme),
            );
          },
        ),
      ),
    );
  }

  void _showMemeDetail(Meme meme) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => MemeDetailSheet(meme: meme),
    );
  }
}

class _MemeCard extends StatelessWidget {
  final Meme meme;
  final VoidCallback onTap;

  const _MemeCard({required this.meme, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Image
              Image.network(
                meme.storageUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  color: AppColors.gray100,
                  child: const Icon(
                    Icons.broken_image_outlined,
                    size: 40,
                    color: AppColors.gray400,
                  ),
                ),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    color: AppColors.gray100,
                    child: const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: AppColors.primary,
                      ),
                    ),
                  );
                },
              ),
              // Stats badge
              Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.share_outlined, size: 14, color: AppColors.gray600),
                      const SizedBox(width: 4),
                      Text(
                        '${meme.usageCount}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.gray600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Status badge
              if (meme.status != 'approved')
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: _getStatusColor(meme.status),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      meme.status.toUpperCase(),
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'processing':
        return AppColors.warning;
      case 'rejected':
        return AppColors.error;
      default:
        return AppColors.gray400;
    }
  }
}
