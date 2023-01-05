part of 'latest_bloc.dart';

@freezed
class LatestState with _$LatestState {
  const factory LatestState.initial() = _Initial;
  const factory LatestState.loading() = _Loading;
  factory LatestState.loaded(List<Anime> data) = _Loaded;
  const factory LatestState.error() = _Error;
}
