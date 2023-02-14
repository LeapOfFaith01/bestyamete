import 'dart:developer' as developer;
import 'package:bestyamete/bloc/index.dart';
import 'package:bestyamete/ui/pages/stream_page.dart';
import 'package:bestyamete/ui/widgets/build_download_actions.dart';
import 'package:bestyamete/utils/helpers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../controllers/download_controller.dart';
import '../../utils/persistence.dart';

class DetailPage extends StatelessWidget {
  bool? isOfflinePage = false;

  DetailPage({Key? key, this.isOfflinePage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<DetailBloc>().state;
    return state.when(
        initial: () => Container(),
        loading: () => Material(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        error: () => Container(),
        loaded: (detalhes, episodios) {
          return Scaffold(
            appBar: AppBar(
              title: Text(detalhes.categoryName!),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: ListView(
              padding: EdgeInsets.all(15),
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * .40,
                    child: CachedNetworkImage(
                      httpHeaders: DataHelpers.baseHeaders,
                      imageUrl: DataHelpers.baseImageUrl + detalhes.categoryImage!,
                      placeholder: (_, __) => CircularProgressIndicator(),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Text('Descrição:',
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 2,
                    )),
                Text(detalhes.categoryDescription!),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text('Generos:',
                          style: TextStyle(
                            fontSize: 20,
                            letterSpacing: 2,
                          )),
                    ),
                    Text('Ano: ${detalhes.ano!}',
                        style: TextStyle(
                          fontSize: 20,
                          letterSpacing: 2,
                        ))
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: detalhes.categoryGenres!
                      .split(',')
                      .map((e) => Text(e.toString().trim()))
                      .toList(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text('Episódios:',
                      style: TextStyle(
                        fontSize: 30,
                        letterSpacing: 2,
                      )),
                ),
                // ..episodios.map((e) => ClipRRect(
                //   borderRadius: BorderRadius.circular(10),
                //   child: ListTile(
                //       onTap: () {
                //         context
                //             .read<StreamingBloc>()
                //             .add(StreamingEvent.load(e.videoId!));
                //         Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) => StreamPage()),
                //         );
                //       },
                //       title: Text(e.title!),
                //       trailing: ValueListenableBuilder(
                //           valueListenable:
                //           GetIt.I<PersistenceHelper>().notifier,
                //           builder: (context, notifier, child) {
                //             var downloads =
                //                 GetIt.I<PersistenceHelper>().downloads;
                //             return downloads.containsKey(e.videoId)
                //                 ? buildActionForTask(
                //                 downloads[e.videoId]!,detalhes)
                //                 : IconButton(
                //                 onPressed: () {
                //                   GetIt.I<DownloadController>()
                //                       .addDownload(e.videoId!,detalhes);
                //                 },
                //                 icon: Icon(Icons.download));
                //           })),
                // ),).toList()
                Container(
                  height: MediaQuery.of(context).size.height * .50,
                  child: ListView.builder(
                    itemCount: episodios.length,
                    itemBuilder: (_, index) => ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: ListTile(
                          onTap: () {
                            context
                                .read<StreamingBloc>()
                                .add(StreamingEvent.load(episodios[index].videoId!));
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StreamPage()),
                            );
                          },
                          title: Text(episodios[index].title!),
                          trailing: ValueListenableBuilder(
                              valueListenable:
                              GetIt.I<PersistenceHelper>().notifier,
                              builder: (context, notifier, child) {
                                var downloads =
                                    GetIt.I<PersistenceHelper>().downloads;
                                return downloads.containsKey(episodios[index].videoId)
                                    ? buildActionForTask(
                                        downloads[episodios[index].videoId]!,detalhes)
                                    : IconButton(
                                          onPressed: () {
                                            GetIt.I<DownloadController>()
                                                .addDownload(episodios[index].videoId!,detalhes);
                                          },
                                          icon: Icon(Icons.download));
                              })),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
