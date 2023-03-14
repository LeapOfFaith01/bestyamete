part of 'search_bloc.dart';

enum SearchType { category, name, letter }

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.started() = _Started;
  const factory SearchEvent.load(String data, SearchType type) = _Load;
}
