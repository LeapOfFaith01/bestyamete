import 'package:freezed_annotation/freezed_annotation.dart';

part 'download_item.freezed.dart';
part 'download_item.g.dart';

@unfreezed
class DownloadItem with _$DownloadItem{
  factory DownloadItem({
    required String name,url,videoId,
    String? categoryId,
    String? itemID,
    @Default(0)
    int progress,
    @Default(0)
    int? status
  }) = _DownloadItem;

  factory DownloadItem.fromJson(Map<String, dynamic> json) => _$DownloadItemFromJson(json);
}


