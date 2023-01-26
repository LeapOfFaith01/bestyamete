import 'package:flutter_downloader/flutter_downloader.dart';

class DownloadItem {
  final String name, url, videoId;
  String? itemID;
  int progress =0;
  DownloadTaskStatus? status = DownloadTaskStatus.undefined;

  DownloadItem({required this.name, required this.url, required this.videoId});

}