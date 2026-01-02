import 'package:flutter/material.dart';
import 'package:memehub_client/memehub_client.dart';
import '../main.dart';

/// 프로필 화면
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<Meme> _myMemes = [];
  bool _isLoading = true;
  int _totalUsage = 0;

  @override
  void initState() {
    super.initState();
    _loadMyMemes();
  }

  Future<void> _loadMyMemes() async {
    setState(() => _isLoading = true);

    try {
      final memes = await client.meme.getMyMemes(limit: 50, offset: 0);
      final totalUsage = memes.fold<int>(0, (sum, m) => sum + m.usageCount);

      setState(() {
        _myMemes = memes;
        _totalUsage = totalUsage;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _loadMyMemes,
          color: AppColors.primary,
          child: CustomScrollView(
            slivers: [
              // Header
              SliverToBoxAdapter(
                child: Container(
                  color: AppColors.white,
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      // Avatar
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: AppColors.blueLight,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(
                          Icons.person_outline,
                          size: 40,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Meme Creator',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.gray900,
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Stats
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                        decoration: BoxDecoration(
                          color: AppColors.background,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _StatItem(
                              value: '${_myMemes.length}',
                              label: 'Uploads',
                            ),
                            Container(
                              width: 1,
                              height: 40,
                              color: AppColors.gray200,
                            ),
                            _StatItem(
                              value: '$_totalUsage',
                              label: 'Total Uses',
                            ),
                            Container(
                              width: 1,
                              height: 40,
                              color: AppColors.gray200,
                            ),
                            _StatItem(
                              value: '0',
                              label: 'Saved',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Section header
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
                  child: Row(
                    children: [
                      const Text(
                        'My Uploads',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.gray900,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '${_myMemes.length} memes',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.gray400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Grid
              if (_isLoading)
                const SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                      strokeWidth: 2,
                    ),
                  ),
                )
              else if (_myMemes.isEmpty)
                SliverFillRemaining(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.cloud_upload_outlined,
                          size: 56,
                          color: AppColors.gray300,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No uploads yet',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.gray400,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              else
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  sliver: SliverGrid(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 6,
                      mainAxisSpacing: 6,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final meme = _myMemes[index];
                        return Container(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.04),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.network(
                                  meme.storageUrl,
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, __, ___) => Container(
                                    color: AppColors.gray100,
                                    child: const Icon(
                                      Icons.broken_image_outlined,
                                      color: AppColors.gray400,
                                    ),
                                  ),
                                ),
                                if (meme.status != 'approved')
                                  Positioned(
                                    top: 4,
                                    left: 4,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 6,
                                        vertical: 2,
                                      ),
                                      decoration: BoxDecoration(
                                        color: _getStatusColor(meme.status),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(
                                        meme.status.substring(0, 3).toUpperCase(),
                                        style: const TextStyle(
                                          color: AppColors.white,
                                          fontSize: 8,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                      childCount: _myMemes.length,
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
      case 'pending':
        return AppColors.gray400;
      case 'processing':
        return AppColors.warning;
      case 'rejected':
        return AppColors.error;
      default:
        return AppColors.success;
    }
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;

  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.gray900,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: AppColors.gray400,
          ),
        ),
      ],
    );
  }
}
