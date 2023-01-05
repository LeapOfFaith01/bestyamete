import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../external/api.dart';
import '../../models/api_interfaces.dart';

part 'popular_event.dart';
part 'popular_state.dart';
part 'popular_bloc.freezed.dart';

class PopularBloc extends Bloc<PopularEvent, PopularState> {
  PopularBloc() : super(const PopularState.initial()) {
    on<_Load>((event, emit)async {
      // TODO: implement event handler
      emit(const PopularState.loading());
      var response = await Api().obterAnimesPopulares();
      emit(PopularState.loaded(response));
    });
  }
}
