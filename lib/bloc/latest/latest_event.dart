part of 'latest_bloc.dart';

@freezed
class LatestEvent with _$LatestEvent {
  const factory LatestEvent.started() = _Started;
  const factory LatestEvent.load() = _Load;
}
