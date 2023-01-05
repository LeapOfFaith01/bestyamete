part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = _Initial;
  const factory SearchState.loading() = _Loading;
  const factory SearchState.error() = _Error;
  factory SearchState.loaded(List<Anime> data) = _Loaded;
}
