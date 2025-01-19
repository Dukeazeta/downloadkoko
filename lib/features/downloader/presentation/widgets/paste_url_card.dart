import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:downloadkoko/config/constants/app_constants.dart';
import '../../../shared/widgets/custom_button.dart';

class PasteUrlCard extends ConsumerWidget {
  const PasteUrlCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
        side: BorderSide(
          color: theme.colorScheme.outline.withOpacity(0.1),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Enter a URL to start downloading',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.textTheme.bodySmall?.color,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppConstants.defaultSpacing * 2),
            TextField(
              style: theme.textTheme.bodyLarge,
              decoration: InputDecoration(
                hintText: 'Paste URL here',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
                  borderSide: BorderSide(
                    color: theme.colorScheme.outline,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
                  borderSide: BorderSide(
                    color: theme.colorScheme.outline.withOpacity(0.5),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
                  borderSide: BorderSide(
                    color: theme.colorScheme.primary,
                  ),
                ),
                prefixIcon: Icon(
                  Icons.link_rounded,
                  color: theme.colorScheme.primary,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.defaultPadding,
                  vertical: AppConstants.defaultPadding,
                ),
              ),
            ),
            const SizedBox(height: AppConstants.defaultSpacing * 2),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(0, 4),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: CustomButton(
                text: 'Download Now',
                icon: Icons.download_rounded,
                onPressed: () {
                  // TODO: Implement download logic
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
