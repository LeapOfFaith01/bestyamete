import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';
import 'dart:developer' as developer;
import 'package:flutter/cupertino.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path_provider_android/path_provider_android.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../external/api.dart';
import '../models/download_item.dart';

part 'download_mob_controller.g.dart';

class DownloadMobController = DownloadBase with _$DownloadMobController;

abstract class DownloadBase with Store {

  //Persistent data variables
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late final SharedPreferences __prefs;
  Map<String, DownloadItem> downloads = {};

  void initializePersistenceModule()async{
    __prefs = await _prefs;
    recoveryFromStorage();
  }
  void recoveryFromStorage(){
    if(__prefs.getKeys().contains('downloads')){
      downloads = json.decode(__prefs.getString('downloads')!).map((key, value){
        print('message download recovery data: $value');
        return MapEntry(key,DownloadItem.fromJson(value));
      }).cast<String,DownloadItem>();
    }
  }

  void update(){
    print('message: ${json.encode(downloads)}');
    __prefs.setString('downloads', json.encode(downloads));
  }

  final Api _api = Api();
  ReceivePort _port = ReceivePort();
  bool isDebug = true;
  late bool _permissionReady;
  late String localPath;

  final ValueNotifier<int> notifier = ValueNotifier(0);

  @action
  void initialize() {
    initializePersistenceModule();
    bindBackgroundIsolate();
    FlutterDownloader.registerCallback(downloadCallback);
    _permissionReady = false;
    _prepare();
  }

  @action
  void addDownload(videoId) {
    updateQueue(videoId);
  }

  @action
  updateQueue(videoId) async {
    var data = await _api.obterDadosDeStreaming(videoId);
    var item = data.first.locationsd != '' ? DownloadItem(name: data.first.title!,url: data.first.locationsd!,videoId: data.first.videoId!):DownloadItem(name: data.first.title!,url: data.first.location!,videoId: data.first.videoId!);
    var itemID = await _requestDownload(item);
    item.itemID = itemID;

    downloads[item.videoId] = item;
    update();
    developer.log(
      'Download Manager',
      name: 'br.tospendtime.download',
      error: downloads,
    );
  }

  @action
  void updateProgress(id, status, progress) {

    // final item = _queue.firstWhere((it) => it.itemID == id);
    final item = downloads.values.firstWhere((element) => element.itemID == id);
    item.status = status.value;
    item.progress = progress;

    // _queue.contains(item.itemID) ? _queue[_queue.indexWhere((e) => e.itemID == item.itemID)] = item : _queue;
    downloads[item.videoId] = item;
    update();
    notifier.value = notifier.value + 1;
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
      // if (isDebug) {
      //   print('UI Isolate Callback: $data');
      // }
      //Recupera o progresso
      String? id = data[0];
      DownloadTaskStatus? status = data[1];
      int progress = data[2];

      //Caso a lista já esteja inicializada atualiza o progresso
      updateProgress(id, status, progress);
    });
  }

  void unbindBackgroundIsolate() =>
      IsolateNameServer.removePortNameMapping('downloader_send_port');

  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    final SendPort send =
    IsolateNameServer.lookupPortByName('downloader_send_port')!;
    send.send([id, status, progress]);
  }

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
    localPath = (await _findLocalPath());
    final saveDir = Directory(localPath);
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

  _requestDownload(DownloadItem item) async {
    developer.log(item.url);
    print(item.url);
    return await FlutterDownloader.enqueue(
      url: item.url,
      savedDir: localPath,
      showNotification: true,
      headers: {
        "user-agent":
        "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/108.0.1462.54"
      },
      fileName: '${item.videoId}.mp4',
    );
  }

  void pauseDownload(DownloadItem item) async =>
      await FlutterDownloader.pause(taskId: item.itemID!);

  void retryDownload(DownloadItem item) async {
    var data = downloads.values.firstWhere((element) => element.videoId == item.videoId);

    String? newTaskId = await FlutterDownloader.retry(taskId: item.itemID!);
    data.itemID = newTaskId;
    downloads[data.videoId] = data;
  }

  void resumeDownload(DownloadItem item) async {
    String? newTaskId = await FlutterDownloader.resume(taskId: item.itemID!);
    final updatedItem = downloads.values.firstWhere((element) => element.itemID == item.itemID);
    updatedItem.itemID = newTaskId;
    downloads[item.videoId] = updatedItem;
  }

  void delete(DownloadItem item) async {
    await FlutterDownloader.remove(
        taskId: item.itemID!, shouldDeleteContent: true);
    await _prepare();
  }
}
