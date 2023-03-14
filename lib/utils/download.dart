import 'dart:isolate';
import 'dart:ui';

import 'package:bestyamete/utils/permissions.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

class DownloadHelper {
  @pragma('vm:entry-point')
  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    final SendPort send =
        IsolateNameServer.lookupPortByName('downloader_send_port')!;
    send.send([id, status, progress]);
  }

  final ReceivePort _port = ReceivePort();

  void bindBackgroundIsolate(PermissionsHelper helper,
      Function(String? id, DownloadTaskStatus? status, int progress) callback) {
    bool isSucess = IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');

    if (!isSucess) {
      helper.checkPermission();
      unbindBackgroundIsolate();
      bindBackgroundIsolate(helper, callback);
      return;
    }
    _port.listen((data) async {
      String? id = data[0];
      DownloadTaskStatus? status = data[1];
      int progress = data[2];
      callback(id, status, progress);
    });
  }

  void unbindBackgroundIsolate() =>
      IsolateNameServer.removePortNameMapping('downloader_send_port');
}
