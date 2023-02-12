import 'package:bestyamete/bloc/index.dart';
import 'package:bestyamete/mob/download_mob_controller.dart';
import 'package:bestyamete/mob/favoritos_mob_controller.dart';
import 'package:bestyamete/ui/pages/stream_page.dart';
import 'package:bestyamete/ui/widgets/anime_list_horizontal.dart';
import 'package:bestyamete/ui/widgets/build_download_actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../controllers/DownloadController.dart';
import '../../main.dart';
import '../../utils/persistence.dart';

class Bookmarks extends StatelessWidget {
  const Bookmarks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meus dados'),
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Favoritos',
              ),
              Tab(text: 'Downloads')
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ValueListenableBuilder(
                valueListenable: GetIt.I<FavoritosController>().notifier,
                builder: (context, notifier, widget) {
                  var data = GetIt.I<FavoritosController>().favoritos;
                  return data.values.length > 0
                      ? AnimeListHorizontal(data: data.values.toList())
                      : Center(
                          child:
                              Text('Parece que você não possui favoritos :('),
                        );
                }),
            ValueListenableBuilder(
                valueListenable: GetIt.I<PersistenceHelper>().notifier,
                builder: (context, notifier, child) {
                  var data = GetIt.I<PersistenceHelper>().downloads;
                  var keys = data.values.toList();
                  return data.isNotEmpty
                      ? ListView.builder(
                          itemCount: keys.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(keys[index].name),
                              onTap: () {
                                context.read<StreamingBloc>().add(
                                    StreamingEvent.load(keys[index].videoId));
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => StreamPage()));
                              },
                              trailing: buildActionForTask(keys[index]),
                            );
                          })
                      : Center(
                          child:
                              Text('Parece que você não possui downloads :('),
                        );
                })
          ],
        ),
      ),
    );
  }
}
