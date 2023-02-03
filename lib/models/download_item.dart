import 'package:freezed_annotation/freezed_annotation.dart';

part 'download_item.freezed.dart';
part 'download_item.g.dart';

@unfreezed
class DownloadItem with _$DownloadItem{
  factory DownloadItem({
    required String name,url,videoId,
    String? itemID,
    @Default(0)
    int progress,
    int? status
  }) = _DownloadItem;

  factory DownloadItem.fromJson(Map<String, dynamic> json) => _$DownloadItemFromJson(json);
}

// @unfreezed
// @JsonSerializable(explicitToJson: true, includeIfNull: false)
// class DownloadItem with _$DownloadItem{
//   final String name, url, videoId;
//   String? itemID;
//   int progress=0;
//   int? status;
//   DownloadItem({required this.name,required this.url,required this.videoId, this.itemID, this.status, this.progress = 0});
//   // factory DownloadItem({
//   //   required String name,
//   //   required String url,
//   //   required String videoId,
//   //   String? itemID,
//   //
//   //   @Default(0) int progress,
//   //   @Default(0)
//   //   @DTS.DownloadTaskStatusConverter()
//   //   DTS.DownloadTaskStatus? status
//   // }) = _DownloadItem;
//
//   factory DownloadItem.fromJson(Map<String, dynamic> json) => _$DownloadItemFromJson(json);
//
//   Map<String,dynamic> toJson() => _$DownloadItemToJson(this);
// }


