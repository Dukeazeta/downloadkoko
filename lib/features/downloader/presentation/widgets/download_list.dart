import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:downloadkoko/config/constants/app_constants.dart';
import 'download_item.dart';

class DownloadList extends ConsumerWidget {
  const DownloadList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    // TODO: Replace with actual downloads from state
    final downloads = <String>[];

    if (downloads.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceVariant.withOpacity(0.5),
          borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.download_done_rounded,
              size: 48,
              color: theme.colorScheme.primary.withOpacity(0.5),
            )
                .animate(onPlay: (controller) => controller.repeat())
                .shimmer(duration: AppConstants.longAnimationDuration),
            const SizedBox(height: AppConstants.defaultSpacing),
            Text(
              'No Downloads Yet',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: AppConstants.defaultSpacing / 2),
            Text(
              'Your downloads will appear here',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant.withOpacity(0.7),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: downloads.length,
      separatorBuilder: (context, index) => 
          const SizedBox(height: AppConstants.defaultSpacing),
      itemBuilder: (context, index) {
        return const DownloadItem();
      },
    );
  }
}
