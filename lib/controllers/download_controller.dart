import 'package:bestyamete/external/api.dart';
import 'package:bestyamete/models/api_interfaces.dart';
import 'package:bestyamete/utils/download.dart';
import 'package:bestyamete/utils/permissions.dart';
import 'package:bestyamete/utils/persistence.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get_it/get_it.dart';

import '../models/download_item.dart';

class FlutterDownloaderDownloadController {
  //Make this class reactive
  ValueNotifier<int> notifier = ValueNotifier(0);

  void _notify() {
    notifier.value = notifier.value++;
  }

  //Permissions Helper class to help to handle user permissions
  PermissionsHelper permissionHelper = PermissionsHelper();

  //Flutter Downloader Helper class to help to handle some situations;
  DownloadHelper downloadHelper = DownloadHelper();

  late PersistenceHelper persistenceHelper;

  String? localPath;

  //Download module related functions
  void initialize() async {
    persistenceHelper = GetIt.I<PersistenceHelper>();
    // initializePersistenceModule();
    downloadHelper.bindBackgroundIsolate(permissionHelper, updateProgress);
    await FlutterDownloader.registerCallback(DownloadHelper.downloadCallback);
    await permissionHelper.prepare();
    localPath = permissionHelper.localPath;
  }

  void addDownload(videoId, Detalhes data) {
    persistenceHelper.detalhes[data.id!] = data;
    persistenceHelper.registerOfflineDetailPage();
    updateQueue(videoId);
  }

  void updateQueue(videoId) async {
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
    var itemID = await _requestDownload(item);
    item.itemID = itemID;

    persistenceHelper.downloads[item.videoId!] = item;
    persistenceHelper.update();
    persistenceHelper.notify();
  }

  void updateProgress(id, status, progress) {
    // final item = _queue.firstWhere((it) => it.itemID == id);
    final item = persistenceHelper.downloads.values
        .firstWhere((element) => element.itemID == id);
    item.status = status.value;
    item.progress = progress;

    // _queue.contains(item.itemID) ? _queue[_queue.indexWhere((e) => e.itemID == item.itemID)] = item : _queue;
    persistenceHelper.downloads[item.videoId] = item;
    persistenceHelper.update();
    persistenceHelper.notify();
  }

  //Flutter downloader Actions

  Future<String?> _requestDownload(DownloadItem item) async {
    return await FlutterDownloader.enqueue(
      url: item.url,
      savedDir: permissionHelper.localPath,
      showNotification: true,
      allowCellular: false,
      openFileFromNotification: false,
      headers: {
        "user-agent":
            "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54"
      },
      fileName: '${item.videoId}.mp4',
    );
  }

  Future<void> pauseDownload(DownloadItem item) async =>
      await FlutterDownloader.pause(taskId: item.itemID!);

  Future<void> retryDownload(DownloadItem item) async {
    var data = persistenceHelper.downloads.values
        .firstWhere((element) => element.videoId == item.videoId);

    String? newTaskId = await FlutterDownloader.retry(taskId: item.itemID!);
    data.itemID = newTaskId;
    persistenceHelper.downloads[data.videoId] = data;
    persistenceHelper.notify();
  }

  Future<void> resumeDownload(DownloadItem item) async {
    String? newTaskId = await FlutterDownloader.resume(taskId: item.itemID!);
    final updatedItem = persistenceHelper.downloads.values
        .firstWhere((element) => element.itemID == item.itemID);
    updatedItem.itemID = newTaskId;
    persistenceHelper.downloads[item.videoId] = updatedItem;
    persistenceHelper.notify();
  }

  Future<void> delete(DownloadItem item) async {
    await FlutterDownloader.remove(
        taskId: item.itemID!, shouldDeleteContent: true);
    persistenceHelper.downloads.remove(item.videoId);

    if (persistenceHelper.downloads.values
        .where((element) => element.categoryId == item.categoryId)
        .isEmpty) {
      persistenceHelper.detalhes.remove(item.categoryId);
    }

    persistenceHelper.notify();
    await permissionHelper.prepare();
  }
}
