import 'package:bestyamete/external/api.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/api_interfaces.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(const SearchState.initial()) {
    on<_Load>((event, emit) async {
      List<Anime> response = [];

      emit(const SearchState.loading());
      switch(event.type){
        case SearchType.category:
          response = await Api().obterAnimesPorCategoria(event.data);
          emit(SearchState.loaded(response));
          break;
        case SearchType.name:
          response = await Api().obterAnimesPorNome(event.data);
          emit(SearchState.loaded(response));
          break;
        case SearchType.letter:
          response = await Api().obterAnimesPorLetra(event.data);
          emit(SearchState.loaded(response));
          break;
      }
    });
  }
}
