part of 'streaming_bloc.dart';

@freezed
class StreamingEvent with _$StreamingEvent {
  const factory StreamingEvent.started() = _Started;
  const factory StreamingEvent.load(String id) = _Load;
}
