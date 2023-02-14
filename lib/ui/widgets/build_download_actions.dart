import 'package:bestyamete/controllers/download_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get_it/get_it.dart';

import '../../models/download_item.dart';

Widget buildActionForTask(DownloadItem item, detalhe) {
  if (item.status == DownloadTaskStatus.undefined.value) {
    return RawMaterialButton(
      onPressed: () {
        GetIt.I<DownloadController>().addDownload(item, detalhe);
      },
      child: Icon(Icons.file_download),
      shape: CircleBorder(),
      constraints: BoxConstraints(minHeight: 32.0, minWidth: 32.0),
    );
  }
  else if (item.status == DownloadTaskStatus.enqueued.value) {
    return RawMaterialButton(
      onPressed: () {
        // GetIt.I<DownloadController>().addDownload(item);
      },
      child: Icon(Icons.ac_unit),
      shape: CircleBorder(),
      constraints: BoxConstraints(minHeight: 32.0, minWidth: 32.0),
    );
  }
  else if (item.status == DownloadTaskStatus.running.value) {
    return RawMaterialButton(
      onPressed: () {
        GetIt.I<DownloadController>().pauseDownload(item);
      },
      shape: CircleBorder(),
      constraints: BoxConstraints(minHeight: 32.0, minWidth: 32.0),
      child: ProgressWithIcon(
        progress: item.progress + 0.0,
      ),
    );
  }
  else if (item.status == DownloadTaskStatus.paused.value) {
    return RawMaterialButton(
      onPressed: () {
        GetIt.I<DownloadController>().resumeDownload(item);
      },
      child: Icon(
        Icons.play_arrow,
        color: Colors.green,
      ),
      shape: CircleBorder(),
      constraints: BoxConstraints(minHeight: 32.0, minWidth: 32.0),
    );
  }else if (item.status == DownloadTaskStatus.paused.value) {
    return RawMaterialButton(
      onPressed: () {
        // GetIt.I<DownloadMobController>().resumeDownload(item);
      },
      child: Icon(
        Icons.info,
        color: Colors.blue,
      ),
      shape: CircleBorder(),
      constraints: BoxConstraints(minHeight: 32.0, minWidth: 32.0),
    );
  }
  else if (item.status == DownloadTaskStatus.complete.value) {
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

  else if (item.status == DownloadTaskStatus.failed.value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text('Failed', style: TextStyle(color: Colors.red)),
        RawMaterialButton(
          onPressed: () {
            GetIt.I<DownloadController>().retryDownload(item);
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
    return SizedBox(height: 50,width: 50,);
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
          progress > 0 ?
          CircularProgressIndicator(
            value: progress / 100,
          ): CircularProgressIndicator(),
        ],
      ),
    );
  }
}