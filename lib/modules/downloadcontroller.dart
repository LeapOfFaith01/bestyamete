import 'package:bestyamete/models/download_item.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:bestyamete/utils/helpers.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path_provider_android/path_provider_android.dart';
import 'package:permission_handler/permission_handler.dart';

import '../external/api.dart';

class DownloadController {
  ValueNotifier<List<DownloadItem>> queue = ValueNotifier<List<DownloadItem>>([]);


  final Api _api = Api();

  ///Variables Setup
  ReceivePort _port = ReceivePort();
  bool isDebug = true;
  late bool _permissionReady;
  late String _localPath;

  void initialize() {
    bindBackgroundIsolate();
    FlutterDownloader.registerCallback(DataHelpers.downloadCallback);
    _permissionReady = false;
    _prepare();
  }

  void unbindBackgroundIsolate() =>
      IsolateNameServer.removePortNameMapping('downloader_send_port');

  Future<Null> _prepare() async {
    _permissionReady = await _checkPermission();
    if (_permissionReady) {
      await _prepareSaveDir();
    }
  }

  Future<bool> _checkPermission() async {
    if (Platform.isIOS) return true;
    while (!await Permission.storage.status.isGranted) {
      await Permission.storage.request();
    }
    return true;
  }

  Future<void> _prepareSaveDir() async {
    _localPath = (await _findLocalPath());
    final saveDir = Directory(_localPath);
    bool hasExisted = await saveDir.exists();
    if (!hasExisted) saveDir.create();
  }

  Future<String> _findLocalPath() async {
    var externalStorageDirPath;
    try {
      externalStorageDirPath = await PathProviderAndroid().getDownloadsPath();
    } catch (e) {
      final directory = (await getExternalStorageDirectory())?.absolute.path;
      externalStorageDirPath = directory;
    }
    return externalStorageDirPath;
  }

  void bindBackgroundIsolate() {
    bool isSucess = IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');

    if (!isSucess) {
      _checkPermission();
      unbindBackgroundIsolate();
      bindBackgroundIsolate();
      return;
    }

    _port.listen((data) async {
      if (isDebug) {
        print('UI Isolate Callback: $data');
      }
      //Recupera o progresso
      String? id = data[0];
      DownloadTaskStatus? status = data[1];
      int progress = data[2];

      //Caso a lista já esteja inicializada atualiza o progresso
      if (queue.value.isNotEmpty) {
        final item = queue.value.firstWhere((it) => it.itemID == id);
        item.status = status;
        item.progress = progress;
        queue.value.contains(item.itemID)
            ? queue.value[queue.value.indexWhere((e) => e.itemID == item.itemID)] = item
            : queue.value;
      }
    });
  }

  _requestDownload(DownloadItem item) async {
    return await FlutterDownloader.enqueue(
      url: item.url,
      savedDir: _localPath,
      showNotification: true,
      requiresStorageNotLow: true,
      headers: {
        "user-agent":
            "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54"
      },
      fileName: item.name,
    );
  }

  void addDownload(videoId) async {
    var data = await _api.obterDadosDeStreaming(videoId);
    var item = data.first.locationsd != null
        ? DownloadItem(
            name: data.first.title!,
            url: data.first.locationsd!,
            videoId: data.first.videoId!)
        : DownloadItem(
            name: data.first.title!,
            url: data.first.location!,
            videoId: data.first.videoId!);
    var itemId = await _requestDownload(item);
    item.itemID = itemId;
    queue.value.add(item);
  }

  void _pauseDownload(DownloadItem item) async =>
      await FlutterDownloader.pause(taskId: item.itemID!);

  void _retryDownload(DownloadItem item) async {
    String? newTaskId = await FlutterDownloader.retry(taskId: item.itemID!);
    item.itemID = newTaskId;
  }

  void _resumeDownload(DownloadItem item) async {
    String? newTaskId = await FlutterDownloader.resume(taskId: item.itemID!);
    item.itemID = newTaskId;
  }

  void _delete(DownloadItem item) async {
    await FlutterDownloader.remove(
        taskId: item.itemID!, shouldDeleteContent: true);
    await _prepare();
  }
}
