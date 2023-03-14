import 'package:bestyamete/bloc/index.dart';
import 'package:bestyamete/ui/pages/detail_page.dart';
import 'package:bestyamete/ui/pages/stream_page.dart';
import 'package:bestyamete/utils/connectivity.dart';
import 'package:bestyamete/utils/helpers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../models/api_interfaces.dart';
import '../../utils/persistence.dart';

class AnimeListHorizontal extends StatelessWidget {
  final List<Anime> data;
  bool isEpisode = false;
  AnimeListHorizontal(
      {Key? key, bool this.isEpisode = false, required List<Anime> this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 16 / 9),
      itemCount: data.length,
      itemBuilder: (context, __) => ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: GestureDetector(
          onTap: () async {
            if (!isEpisode) {
              if (await ConnectivityHelper.isOnline()) {
                data[__].id == null
                    ? context
                        .read<DetailBloc>()
                        .add(DetailEvent.load(data[__].categoryId!))
                    : context
                        .read<DetailBloc>()
                        .add(DetailEvent.load(data[__].id!));
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailPage()),
                );
              } else {
                data[__].id == null
                    ? context
                        .read<DetailBloc>()
                        .add(DetailEvent.loadOffline(data[__].categoryId!))
                    : context
                        .read<DetailBloc>()
                        .add(DetailEvent.loadOffline(data[__].id!));
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailPage()),
                );
              }
            } else {
              if (data[__].videoId != null) {
                context
                    .read<StreamingBloc>()
                    .add(StreamingEvent.load(data[__].videoId!));
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StreamPage()),
                );
              }
            }
          },
          child: GridTile(
              child: Container(
            color: Colors.black45,
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: CachedNetworkImage(
                    imageUrl:
                        DataHelpers.baseImageUrl + data[__].categoryImage!,
                    httpHeaders: DataHelpers.baseHeaders,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                    flex: 6,
                    child: Column(
                      children: [
                        isEpisode
                            ? Container()
                            : Align(
                                alignment: Alignment.topRight,
                                child: ValueListenableBuilder(
                                  valueListenable:
                                      GetIt.I<PersistenceHelper>().notifier,
                                  builder: (BuildContext context, value,
                                      Widget? child) {
                                    var favs =
                                        GetIt.I<PersistenceHelper>().favoritos;
                                    return favs.containsKey(data[__].id!)
                                        ? IconButton(
                                            onPressed: () {
                                              GetIt.I<PersistenceHelper>()
                                                  .toggleFavorite(data[__]);
                                            },
                                            icon: Icon(Icons.favorite))
                                        : IconButton(
                                            onPressed: () {
                                              GetIt.I<PersistenceHelper>()
                                                  .toggleFavorite(data[__]);
                                            },
                                            icon: Icon(Icons.favorite_outline));
                                  },
                                )),
                        Expanded(
                            child: Padding(
                          padding: isEpisode
                              ? EdgeInsets.symmetric(horizontal: 15)
                              : const EdgeInsets.only(
                                  left: 15.0, right: 15.0, top: 12.0),
                          child: isEpisode
                              ? Center(
                                  child: Text(
                                    data[__].title!,
                                    softWrap: false,
                                    maxLines: 4,
                                    style: TextStyle(
                                        fontSize: 15,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                )
                              : Text(
                                  data[__].categoryName!,
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
      ),
    );
  }
}
