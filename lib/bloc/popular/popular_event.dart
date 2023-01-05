part of 'popular_bloc.dart';

@freezed
class PopularEvent with _$PopularEvent {
  const factory PopularEvent.started() = _Started;
  const factory PopularEvent.load() = _Load;
}
