part of 'download_cubit.dart';

@freezed
class DownloadState with _$DownloadState {
  const factory DownloadState.initial() = _Initial;
  factory DownloadState.update(List<DownloadItem> data) = _Update;
}
