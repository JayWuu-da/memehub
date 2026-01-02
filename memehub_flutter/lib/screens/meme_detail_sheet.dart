import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:memehub_client/memehub_client.dart';
import '../main.dart';

/// 짤 상세 보기 바텀 시트
class MemeDetailSheet extends StatelessWidget {
  final Meme meme;

  const MemeDetailSheet({super.key, required this.meme});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            children: [
              // Handle
              Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.gray200,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              // Content
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.gray100,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            meme.storageUrl,
                            fit: BoxFit.contain,
                            width: double.infinity,
                            errorBuilder: (_, __, ___) => Container(
                              height: 200,
                              color: AppColors.gray100,
                              child: const Center(
                                child: Icon(
                                  Icons.broken_image_outlined,
                                  size: 64,
                                  color: AppColors.gray400,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Actions
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _ActionButton(
                            icon: Icons.share_outlined,
                            label: 'Share',
                            onTap: () => _share(context),
                          ),
                          _ActionButton(
                            icon: Icons.content_copy_outlined,
                            label: 'Copy',
                            onTap: () => _copy(context),
                          ),
                          _ActionButton(
                            icon: Icons.bookmark_border,
                            label: 'Save',
                            onTap: () => _save(context),
                          ),
                          _ActionButton(
                            icon: Icons.download_outlined,
                            label: 'Download',
                            onTap: () => _download(context),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // Stats
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.background,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _StatItem(
                              icon: Icons.share_outlined,
                              value: '${meme.usageCount}',
                              label: 'Uses',
                            ),
                            _StatItem(
                              icon: Icons.calendar_today_outlined,
                              value: _formatDate(meme.createdAt),
                              label: 'Uploaded',
                            ),
                            _StatItem(
                              icon: Icons.photo_size_select_actual_outlined,
                              value: '${meme.width}×${meme.height}',
                              label: 'Size',
                            ),
                          ],
                        ),
                      ),

                      // AI Analysis
                      if (meme.aiDescription != null ||
                          (meme.tags != null && meme.tags!.isNotEmpty)) ...[
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: AppColors.blueLight,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(
                                Icons.auto_awesome,
                                size: 16,
                                color: AppColors.primary,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'AI Analysis',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.gray900,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),

                        if (meme.aiDescription != null) ...[
                          Text(
                            meme.aiDescription!,
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.gray600,
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],

                        if (meme.tags != null && meme.tags!.isNotEmpty)
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: meme.tags!.map((tag) {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.blueLight,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  '#$tag',
                                  style: const TextStyle(
                                    color: AppColors.primary,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                      ],

                      // OCR Text
                      if (meme.ocrText != null && meme.ocrText!.isNotEmpty) ...[
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: AppColors.gray100,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Icons.text_fields,
                                size: 16,
                                color: AppColors.gray600,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Text in Image',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.gray900,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.gray100,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            meme.ocrText!,
                            style: TextStyle(
                              fontFamily: 'monospace',
                              fontSize: 14,
                              color: AppColors.gray600,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);

    if (diff.inDays == 0) return 'Today';
    if (diff.inDays == 1) return 'Yesterday';
    if (diff.inDays < 7) return '${diff.inDays}d ago';
    return '${date.month}/${date.day}';
  }

  void _share(BuildContext context) async {
    try {
      await client.meme.recordUsage(meme.id!, 'share');
    } catch (_) {}

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sharing...')),
      );
    }
  }

  void _copy(BuildContext context) async {
    await Clipboard.setData(ClipboardData(text: meme.storageUrl));

    try {
      await client.meme.recordUsage(meme.id!, 'app');
    } catch (_) {}

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('URL copied')),
      );
    }
  }

  void _save(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Save to collection (coming soon)')),
    );
  }

  void _download(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Download started')),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: AppColors.primary, size: 22),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: AppColors.gray600,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _StatItem({
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 18, color: AppColors.gray400),
        const SizedBox(height: 6),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: AppColors.gray900,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: AppColors.gray400,
          ),
        ),
      ],
    );
  }
}
