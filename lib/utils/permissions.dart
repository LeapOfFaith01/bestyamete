import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path_provider_android/path_provider_android.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsHelper {
  late bool _isReady;
  late String localPath;

  Future<Null> prepare() async {
    _isReady = await checkPermission();
    if (_isReady) {
      await _prepareSaveDir();
    }
  }

  Future<bool> checkPermission() async {
    if (Platform.isIOS) return true;
    while (!await Permission.storage.status.isGranted) {
      await Permission.storage.request();
    }
    return true;
  }

  Future<String> _prepareSaveDir() async {
    localPath = (await _findLocalPath());
    final saveDir = Directory(localPath);
    bool hasExisted = await saveDir.exists();
    if (!hasExisted) saveDir.create();
    return localPath;
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
}