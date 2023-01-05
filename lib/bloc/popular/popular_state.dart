part of 'popular_bloc.dart';

@freezed
class PopularState with _$PopularState {
  const factory PopularState.initial() = _Initial;
  const factory PopularState.loading() = _Loading;
  const factory PopularState.error() = _Error;
  factory PopularState.loaded(List<Anime> data) = _Loaded;
}
