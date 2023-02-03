// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_mob_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DownloadMobController on DownloadBase, Store {
  late final _$updateQueueAsyncAction =
      AsyncAction('DownloadBase.updateQueue', context: context);

  @override
  Future updateQueue(dynamic videoId) {
    return _$updateQueueAsyncAction.run(() => super.updateQueue(videoId));
  }

  late final _$DownloadBaseActionController =
      ActionController(name: 'DownloadBase', context: context);

  @override
  void initialize() {
    final _$actionInfo = _$DownloadBaseActionController.startAction(
        name: 'DownloadBase.initialize');
    try {
      return super.initialize();
    } finally {
      _$DownloadBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addDownload(dynamic videoId) {
    final _$actionInfo = _$DownloadBaseActionController.startAction(
        name: 'DownloadBase.addDownload');
    try {
      return super.addDownload(videoId);
    } finally {
      _$DownloadBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateProgress(dynamic id, dynamic status, dynamic progress) {
    final _$actionInfo = _$DownloadBaseActionController.startAction(
        name: 'DownloadBase.updateProgress');
    try {
      return super.updateProgress(id, status, progress);
    } finally {
      _$DownloadBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
