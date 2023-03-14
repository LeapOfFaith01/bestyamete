import 'package:bestyamete/utils/downloader_interceptor.dart';
import 'package:bestyamete/utils/helpers.dart';
import 'package:dio/dio.dart';
import 'package:flutter_download_manager/flutter_download_manager.dart';
import 'package:get_it/get_it.dart';

import '../external/api.dart';
import '../models/api_interfaces.dart';
import '../models/download_item.dart';
import '../utils/permissions.dart';
import '../utils/persistence.dart';

class FlutterDownloaderManagerController {
  String? localpath;
  late PersistenceHelper persistenceHelper;
//Permissions Helper class to help to handle user permissions
  PermissionsHelper permissionHelper = PermissionsHelper();

  DownloadManager dl = DownloadManager(maxConcurrentTasks: 5);

  void initialize() async {
    // dl.dio.interceptors
    //     .add(InterceptorsWrapper(onRequest: (RequestOptions? options) {
    //   options.headers.addAll(DataHelpers.baseHeaders);
    // }));
    // dl.dio.interceptors.add(DownloaderInterceptor());
    dl.dio.options.headers.addAll(DataHelpers.baseHeaders);
    dl.dio.options.followRedirects = true;
    persistenceHelper = GetIt.I<PersistenceHelper>();
    await permissionHelper.prepare();
    localpath = permissionHelper.localPath;
  }
  void createDownloadTask(videoId, Detalhes data) {
    persistenceHelper.detalhes[data.id!] = data;
    persistenceHelper.registerOfflineDetailPage();
    fetchDownloadUrl(videoId);

  }

  void fetchDownloadUrl(videoId) async {
    var data = await Api().obterDadosDeStreaming(videoId);
    var item = data.first.locationsd != ''
        ? DownloadItem(
            name: data.first.title!,
            url: data.first.locationsd!,
            videoId: data.first.videoId!,
            categoryId: data.first.categoryId)
        : DownloadItem(
            name: data.first.title!,
            url: data.first.location!,
            videoId: data.first.videoId!,
            categoryId: data.first.categoryId);
    download(item);
  }

  void download(DownloadItem data) async {
    //Create a download
    dl.addDownload(data.url, '$localpath/${data.videoId}.mp4');

    DownloadTask? task = dl.getDownload(data.url);

    task?.status.addListener(() {
      print(task.status.value);
    });

    task?.progress.addListener(() {
      print(task.progress.value);
    });

    await dl.whenDownloadComplete(data.url);
  }
}
