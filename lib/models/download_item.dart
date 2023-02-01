import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'download_item.g.dart';
part 'download_item.freezed.dart';

@unfreezed
class DownloadItem with _$DownloadItem {
  // final String name, url, videoId;
  // String? itemID;
  // int progress =0;
  // DownloadTaskStatus? status = DownloadTaskStatus.undefined;
  //
  // DownloadItem({required this.name, required this.url, required this.videoId});
  factory DownloadItem({
    required String name,
    required String url,
    required String videoId,
    String? itemID,

    @Default(0) int progress,
    @Default(DownloadTaskStatus.undefined)
    @DownloadTaskStatusConverter()
    DownloadTaskStatus? status
  }) = _DownloadItem;

  factory DownloadItem.fromJson(Map<String, dynamic> json) => _$DownloadItemFromJson(json);
}


class DownloadTaskStatusConverter implements JsonConverter<DownloadTaskStatus?, int?>{
  const DownloadTaskStatusConverter();

  @override
  DownloadTaskStatus? fromJson(int? json) {
    return DownloadTaskStatus(json!);
  }

  @override
  toJson(DownloadTaskStatus? object) {
    return object!.value;
  }
}
