part of 'detail_bloc.dart';

@freezed
class DetailEvent with _$DetailEvent {
  const factory DetailEvent.started() = _Started;
  const factory DetailEvent.load(String id) = _Load;
  const factory DetailEvent.loadOffline(String id) = _LoadOffline;
}
