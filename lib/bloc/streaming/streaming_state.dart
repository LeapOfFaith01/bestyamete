part of 'streaming_bloc.dart';

@freezed
class StreamingState with _$StreamingState {
  const factory StreamingState.initial() = _Initial;
  const factory StreamingState.loading() = _Loading;
  const factory StreamingState.error() = _Error;
  factory StreamingState.loaded(Stream actual, Stream next) = _Loaded;
}
