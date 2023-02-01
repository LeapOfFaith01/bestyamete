import 'package:bestyamete/mob/download_mob_controller.dart';
import 'package:bestyamete/mob/favoritos_mob_controller.dart';
import 'package:bestyamete/ui/pages/stream_page.dart';
import 'package:bestyamete/ui/widgets/anime_list_horizontal.dart';
import 'package:bestyamete/ui/widgets/build_download_actions.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

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
                valueListenable: getIt<FavoritosController>().notifier,
                builder: (context, notifier, widget) {
                  var data = getIt<FavoritosController>().favoritos;
                  return data.values.length > 0
                      ? AnimeListHorizontal(data: data.values.toList())
                      : Center(
                          child:
                              Text('Parece que você não possui favoritos :('),
                        );
                }),
            ValueListenableBuilder(
                valueListenable: getIt<DownloadMobController>().notifier,
                builder: (context, notifier, child) {
                  var data = getIt<DownloadMobController>().queue.toList();
                  return data.length > 0
                      ? ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(data[index].name),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => StreamPage()));
                              },
                              trailing: buildActionForTask(data[index]),
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
