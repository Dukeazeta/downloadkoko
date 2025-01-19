import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:downloadkoko/config/constants/app_constants.dart';

class DownloadProgress extends StatelessWidget {
  final double progress;
  final String status;
  final bool isError;

  const DownloadProgress({
    super.key,
    required this.progress,
    required this.status,
    this.isError = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              status,
              style: theme.textTheme.bodySmall?.copyWith(
                color: isError 
                    ? theme.colorScheme.error 
                    : theme.colorScheme.onSurfaceVariant,
              ),
            ),
            Text(
              '${(progress * 100).toStringAsFixed(0)}%',
              style: theme.textTheme.bodySmall?.copyWith(
                color: isError 
                    ? theme.colorScheme.error 
                    : theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppConstants.defaultSpacing / 2),
        Stack(
          children: [
            // Background
            Container(
              height: 4,
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceVariant,
                borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
              ),
            ),
            // Progress
            AnimatedContainer(
              duration: AppConstants.defaultAnimationDuration,
              height: 4,
              width: MediaQuery.of(context).size.width * progress,
              decoration: BoxDecoration(
                color: isError 
                    ? theme.colorScheme.error 
                    : theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
              ),
            )
                .animate()
                .shimmer(
                  duration: AppConstants.longAnimationDuration,
                  color: theme.colorScheme.primary.withOpacity(0.2),
                ),
          ],
        ),
      ],
    );
  }
}
