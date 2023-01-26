import 'package:bestyamete/mob/download_mob_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

import '../../main.dart';
import '../../models/download_item.dart';

Widget buildActionForTask(DownloadItem item) {
  if (item.status == DownloadTaskStatus.undefined) {
    return RawMaterialButton(
      onPressed: () {
        getIt<DownloadMobController>().addDownload(item);
      },
      child: Icon(Icons.file_download),
      shape: CircleBorder(),
      constraints: BoxConstraints(minHeight: 32.0, minWidth: 32.0),
    );
  }
  else if (item.status == DownloadTaskStatus.running) {
    return RawMaterialButton(
      onPressed: () {
        getIt<DownloadMobController>().pauseDownload(item);
      },
      shape: CircleBorder(),
      constraints: BoxConstraints(minHeight: 32.0, minWidth: 32.0),
      child: ProgressWithIcon(
        progress: item.progress + 0.0,
      ),
    );
  }
  else if (item.status == DownloadTaskStatus.paused) {
    return RawMaterialButton(
      onPressed: () {
        getIt<DownloadMobController>().resumeDownload(item);
      },
      child: Icon(
        Icons.play_arrow,
        color: Colors.green,
      ),
      shape: CircleBorder(),
      constraints: BoxConstraints(minHeight: 32.0, minWidth: 32.0),
    );
  }
  else if (item.status == DownloadTaskStatus.complete) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'Ready',
          style: TextStyle(color: Colors.green),
        ),
        RawMaterialButton(
          onPressed: () {

          },
          child: Icon(
            Icons.delete_forever,
            color: Colors.red,
          ),
          shape: CircleBorder(),
          constraints: BoxConstraints(minHeight: 32.0, minWidth: 32.0),
        )
      ],
    );
  }

  else if (item.status == DownloadTaskStatus.failed) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text('Failed', style: TextStyle(color: Colors.red)),
        RawMaterialButton(
          onPressed: () {
            getIt<DownloadMobController>().retryDownload(item);
          },
          child: Icon(
            Icons.refresh,
            color: Colors.green,
          ),
          shape: CircleBorder(),
          constraints: BoxConstraints(minHeight: 32.0, minWidth: 32.0),
        )
      ],
    );
  }else{
    return Container();
  }
}

class ProgressWithIcon extends StatelessWidget {
  final double progress;
  const ProgressWithIcon({Key? key, required this.progress}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(
            Icons.pause,
            color: Colors.red,
          ),
          // you can replace
          CircularProgressIndicator(
            value: progress / 100,
          ),
        ],
      ),
    );
  }
}