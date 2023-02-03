// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DownloadItem _$$_DownloadItemFromJson(Map<String, dynamic> json) =>
    _$_DownloadItem(
      name: json['name'] as String,
      url: json['url'],
      videoId: json['videoId'],
      itemID: json['itemID'] as String?,
      progress: json['progress'] as int? ?? 0,
      status: json['status'] as int?,
    );

Map<String, dynamic> _$$_DownloadItemToJson(_$_DownloadItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
      'videoId': instance.videoId,
      'itemID': instance.itemID,
      'progress': instance.progress,
      'status': instance.status,
    };
