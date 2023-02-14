
import 'package:bestyamete/bloc/detail/detail_bloc.dart';
import 'package:bestyamete/models/download_item.dart';
import 'package:bestyamete/ui/pages/detail_page.dart';
import 'package:bestyamete/ui/widgets/anime_list_horizontal.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../utils/helpers.dart';
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
                valueListenable: GetIt.I<PersistenceHelper>().notifier,
                builder: (context, notifier, widget) {
                  var data = GetIt.I<PersistenceHelper>().favoritos;
                  return data.values.isNotEmpty
                      ? AnimeListHorizontal(data: data.values.toList())
                      : Center(
                          child:
                              Text('Parece que você não possui favoritos :('),
                        );
                }),
            ValueListenableBuilder(
                valueListenable: GetIt.I<PersistenceHelper>().notifier,
                builder: (context, notifier, child) {
                  var episodes = GetIt.I<PersistenceHelper>().downloads;
                  var data = GetIt.I<PersistenceHelper>().detalhes;
                  var keys = data.values.toList();
                  return data.isNotEmpty
                      ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                    itemCount: keys.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1
                                ,childAspectRatio: 16/9,
                                crossAxisSpacing: 10,mainAxisSpacing: 10),
                            itemBuilder: (context, index) {
                              List<DownloadItem> a = [];
                              for(var element in episodes.values){
                                if(element.categoryId == keys[index].id && element.status == 3){
                                  a.add(element);
                                }
                              }
                              return GestureDetector(
                                onTap: (){
                                  context.read<DetailBloc>().add(DetailEvent.loadOffline(keys[index].id!));
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage()));
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: GridTile(
                                      child: Container(
                                        color: Colors.black45,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 4,
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                DataHelpers.baseImageUrl + keys[index].categoryImage!,
                                                httpHeaders: DataHelpers.baseHeaders,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Expanded(
                                                flex: 6,
                                                child: Column(
                                                  children: [
                                                    Align(
                                                        alignment: Alignment.topCenter,
                                                        child: Text('Episódios Sincronizados: ${a.length}')),
                                                    Expanded(
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(
                                                              left: 15.0, right: 15.0, top: 12.0),
                                                          child:Text(
                                                            keys[index].categoryName!,
                                                            softWrap: false,
                                                            maxLines: 4,
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                overflow: TextOverflow.ellipsis),
                                                          ),
                                                        ))
                                                  ],
                                                ))
                                          ],
                                        ),
                                      )),
                                ),
                              );
                            }),
                      )
                      // ListView.builder(
                      //         itemCount: keys.length,
                      //         itemBuilder: (context, index) {
                      //           return ListTile(
                      //             title: Text(keys[index].name),
                      //             onTap: () {
                      //               context.read<StreamingBloc>().add(
                      //                   StreamingEvent.load(keys[index].videoId));
                      //               Navigator.push(
                      //                   context,
                      //                   MaterialPageRoute(
                      //                       builder: (context) => StreamPage()));
                      //             },
                      //             trailing: buildActionForTask(keys[index]),
                      //           );
                      //         })
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
