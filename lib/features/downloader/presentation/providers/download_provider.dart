import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/services/download_service.dart';

// Download states
enum DownloadStatus {
  initial,
  loading,
  downloading,
  completed,
  error,
}

// Download state class
class DownloadState {
  final DownloadStatus status;
  final double progress;
  final String? error;
  final String? filePath;

  DownloadState({
    this.status = DownloadStatus.initial,
    this.progress = 0.0,
    this.error,
    this.filePath,
  });

  DownloadState copyWith({
    DownloadStatus? status,
    double? progress,
    String? error,
    String? filePath,
  }) {
    return DownloadState(
      status: status ?? this.status,
      progress: progress ?? this.progress,
      error: error ?? this.error,
      filePath: filePath ?? this.filePath,
    );
  }
}

// Download notifier
class DownloadNotifier extends StateNotifier<DownloadState> {
  final DownloadService _downloadService;

  DownloadNotifier(this._downloadService) : super(DownloadState());

  Future<void> downloadVideo(String url) async {
    if (url.isEmpty) {
      state = state.copyWith(
        status: DownloadStatus.error,
        error: 'Please enter a valid URL',
      );
      return;
    }

    try {
      // Set loading state
      state = state.copyWith(
        status: DownloadStatus.loading,
        progress: 0,
        error: null,
      );

      // Get video info first
      await _downloadService.getVideoInfo(url);

      // Start download
      state = state.copyWith(status: DownloadStatus.downloading);
      
      final filePath = await _downloadService.downloadVideo(
        url,
        (progress) {
          state = state.copyWith(progress: progress);
        },
      );

      // Set completed state
      state = state.copyWith(
        status: DownloadStatus.completed,
        progress: 1.0,
        filePath: filePath,
      );
    } catch (e) {
      state = state.copyWith(
        status: DownloadStatus.error,
        error: e.toString(),
      );
    }
  }

  void reset() {
    state = DownloadState();
  }
}

// Providers
final downloadServiceProvider = Provider((ref) => DownloadService());

final downloadProvider = StateNotifierProvider<DownloadNotifier, DownloadState>(
  (ref) => DownloadNotifier(ref.watch(downloadServiceProvider)),
);
