import 'package:dio/dio.dart';
import 'package:rapsap_ops_app/core/constants/app_constants.dart';
import 'package:rapsap_ops_app/core/services/media/media_file.dart';

/// The multipart field for a captured photo (`photo`) or clip (`video`).
Map<String, MultipartFile> mediaPart(MediaFile media) {
  if (!media.isVideo) {
    return {
      'photo': MultipartFile.fromBytes(
        media.bytes,
        filename: AppConstants.photoFileName,
        contentType: DioMediaType('image', 'jpeg'),
      ),
    };
  }
  final name = media.name ?? AppConstants.videoFileName;
  return {
    'video': MultipartFile.fromBytes(
      media.bytes,
      filename: name,
      contentType: DioMediaType(
        'video',
        name.toLowerCase().endsWith('.webm') ? 'webm' : 'mp4',
      ),
    ),
  };
}
