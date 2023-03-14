import 'dart:isolate';
import 'dart:ui';

import 'package:flutter_downloader/flutter_downloader.dart';

class DataHelpers {
  static String baseUrl = 'https://appanimeplus.tk/play-api.php';
  static String baseImageUrl = 'https://cdn.appanimeplus.tk/img/';
  static Map<String, String> baseHeaders = {
    'User-Agent':
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36'
  };
  static String baseScheme = 'https';
  static String baseHost = 'appanimeplus.tk';
  static String basePath = 'play-api.php';
  static String latestQuery = 'latest';
  static String categoryQuery = 'categoria';
  static String letterQuery = 'letra';
  static String episodeQuery = 'cat_id';
  static String streamQuery = 'episodios';
  static String searchQuery = 'search';
  static String detailQuery = 'info';
  static String popularQuery = 'populares';
  static String nextEpisodeQuery = 'catid';
  static String nextEpisodePrefixQuery = 'next';
  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    final SendPort send =
        IsolateNameServer.lookupPortByName('downloader_send_port')!;
    send.send([id, status, progress]);
  }
}
