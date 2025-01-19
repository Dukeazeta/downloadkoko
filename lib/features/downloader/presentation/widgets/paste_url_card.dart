import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:downloadkoko/config/constants/app_constants.dart';
import '../../../shared/widgets/custom_button.dart';
import '../providers/download_provider.dart';

class PasteUrlCard extends ConsumerStatefulWidget {
  const PasteUrlCard({super.key});

  @override
  ConsumerState<PasteUrlCard> createState() => _PasteUrlCardState();
}

class _PasteUrlCardState extends ConsumerState<PasteUrlCard> {
  final _urlController = TextEditingController();

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final downloadState = ref.watch(downloadProvider);
    
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
              controller: _urlController,
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
                errorText: downloadState.status == DownloadStatus.error
                    ? downloadState.error
                    : null,
              ),
            ),
            const SizedBox(height: AppConstants.defaultSpacing * 2),
            if (downloadState.status == DownloadStatus.downloading)
              Column(
                children: [
                  LinearProgressIndicator(
                    value: downloadState.progress,
                    backgroundColor: theme.colorScheme.primary.withOpacity(0.1),
                    valueColor: AlwaysStoppedAnimation<Color>(
                      theme.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: AppConstants.defaultSpacing * 2),
                ],
              ),
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
                text: downloadState.status == DownloadStatus.downloading
                    ? 'Downloading...'
                    : downloadState.status == DownloadStatus.completed
                        ? 'Download Complete'
                        : 'Download Now',
                icon: downloadState.status == DownloadStatus.completed
                    ? Icons.check_rounded
                    : Icons.download_rounded,
                onPressed: downloadState.status == DownloadStatus.downloading ||
                        downloadState.status == DownloadStatus.loading
                    ? () {} 
                    : () {
                        if (downloadState.status == DownloadStatus.completed) {
                          ref.read(downloadProvider.notifier).reset();
                          _urlController.clear();
                        } else {
                          ref
                              .read(downloadProvider.notifier)
                              .downloadVideo(_urlController.text);
                        }
                      },
                isLoading: downloadState.status == DownloadStatus.loading,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
