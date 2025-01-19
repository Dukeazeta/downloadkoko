import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:downloadkoko/config/constants/app_constants.dart';
import 'download_progress.dart';

class DownloadItem extends StatelessWidget {
  final String title;
  final double progress;
  final String status;
  final bool isError;

  const DownloadItem({
    super.key,
    this.title = 'File name',
    this.progress = 0.0,
    this.status = 'Waiting...',
    this.isError = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
        border: Border.all(
          color: theme.colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  isError ? Icons.error_outline : Icons.music_note_outlined,
                  color: isError 
                      ? theme.colorScheme.error 
                      : theme.colorScheme.primary,
                  size: 20,
                ).animate().fadeIn(),
                const SizedBox(width: AppConstants.defaultSpacing),
                Expanded(
                  child: Text(
                    title,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_horiz_rounded, size: 20),
                  onPressed: () {
                    // TODO: Show options menu
                  },
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  splashRadius: 24,
                ),
              ],
            ),
            const SizedBox(height: AppConstants.defaultSpacing),
            DownloadProgress(
              progress: progress,
              status: status,
              isError: isError,
            ),
          ],
        ),
      ),
    ).animate().fadeIn().slideX();
  }
}
