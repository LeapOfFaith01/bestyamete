import 'package:bestyamete/external/api.dart';
import 'package:bestyamete/models/api_interfaces.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'latest_bloc.freezed.dart';
part 'latest_event.dart';
part 'latest_state.dart';

class LatestBloc extends Bloc<LatestEvent, LatestState> {
  LatestBloc() : super(const LatestState.initial()) {
    on<_Load>((event, emit) async {
      emit(const LatestState.loading());
      try {
        var data = await Api().obterEpisodiosRecentes();
        emit(LatestState.loaded(data));
      } on Exception {
        emit(const LatestState.error());
      }
    });
  }
}
