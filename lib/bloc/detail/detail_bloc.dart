import 'package:bestyamete/models/api_interfaces.dart';
import 'package:bestyamete/utils/persistence.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';

import '../../external/api.dart';

part 'detail_bloc.freezed.dart';
part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(const DetailState.initial()) {
    on<_Load>((event, emit) async {
      emit(const DetailState.loading());
      var detalhes = await Api().obterDetalhes(event.id);
      var episodios = await Api().obterListaDeEpisodios(event.id);
      emit(DetailState.loaded(detalhes.first, episodios.reversed.toList()));
    });
    on<_LoadOffline>((event, emit) async {
      emit(const DetailState.loading());

      //Retrieve from persistence storage;
      var data = GetIt.I<PersistenceHelper>().detalhes;
      var episodes = GetIt.I<PersistenceHelper>().downloads;

      List<Anime> reduced = [];

      if (data.containsKey(event.id)) {
        var detail = data[event.id];
        for (var element in episodes.values) {
          if (element.categoryId == detail?.id && element.status == 3) {
            reduced.add(Anime(
                categoryId: element.categoryId,
                title: element.name,
                videoId: element.videoId));
          }
        }
        emit(DetailState.loaded(detail!, reduced));
      } else {}
    });
  }
}
