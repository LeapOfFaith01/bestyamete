import 'package:bestyamete/utils/helpers.dart';
import 'package:easy_downloader/easy_downloader.dart';
import 'package:easy_downloader/monitor/download_monitor.dart';
import 'package:bestyamete/utils/persistence.dart';
import 'package:get_it/get_it.dart';

import '../external/api.dart';
import '../models/api_interfaces.dart';
import '../models/download_item.dart';
import '../utils/permissions.dart';

class EasyDownloaderController {
  List<int> data = [];
  List<DownloadController> controllers = [];
  String? localpath;
  late PersistenceHelper persistenceHelper;
//Permissions Helper class to help to handle user permissions
  PermissionsHelper permissionHelper = PermissionsHelper();

  void initialize() async {
    persistenceHelper = GetIt.I<PersistenceHelper>();
    await permissionHelper.prepare();
    localpath = permissionHelper.localPath;
  }

//Action - CreateDownload
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
    var task = await EasyDownloader.newTask(data.url, localpath!, '${data.videoId}.mp4',
        headers: DataHelpers.baseHeaders, maxSplit: 8, showNotification: true,);
    var controller = EasyDownloader.getController(task.downloadId);
    if (controller != null) {
      controller.start(
          monitor: DownloadMonitor(
              duration: Duration(milliseconds: 100),
              onProgress: (downloaded, total, speed, status) {
                print('$downloaded, $total, $speed, $status');
              }));
    }
  }
}
