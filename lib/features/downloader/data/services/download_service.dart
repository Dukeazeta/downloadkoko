import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class DownloadService {
  final _yt = YoutubeExplode();

  // Get video info from URL
  Future<Video> getVideoInfo(String url) async {
    try {
      final video = await _yt.videos.get(url);
      return video;
    } catch (e) {
      throw Exception('Failed to get video info: $e');
    }
  }

  // Download video
  Future<String> downloadVideo(String url, void Function(double) onProgress) async {
    try {
      // Get video manifest
      final manifest = await _yt.videos.streamsClient.getManifest(url);
      final streamInfo = manifest.muxed.withHighestBitrate();
      
      // Get the video stream
      final stream = await _yt.videos.streams.get(streamInfo);
      
      // Get download directory
      final dir = await getDownloadsDirectory();
      if (dir == null) throw Exception('Downloads directory not found');
      
      // Get video metadata
      final video = await _yt.videos.get(url);
      final fileName = '${video.title}.mp4'.replaceAll(RegExp(r'[^\w\s-]'), '_');
      final file = File('${dir.path}/$fileName');
      
      // Create file and write stream
      final fileStream = file.openWrite();
      final len = streamInfo.size.totalBytes;
      var count = 0;
      
      await for (final data in stream) {
        count += data.length;
        fileStream.add(data);
        onProgress(count / len);
      }
      
      await fileStream.flush();
      await fileStream.close();
      _yt.close(); // Remove await since close() returns void
      
      return file.path;
    } catch (e) {
      throw Exception('Failed to download video: $e');
    }
  }

  void dispose() {
    _yt.close();
  }
}
