import 'package:bestyamete/bloc/index.dart';
import 'package:bestyamete/ui/delegates/search_delegate.dart';
import 'package:bestyamete/ui/pages/bookmarks_page.dart';
import 'package:bestyamete/ui/widgets/anime_list_horizontal.dart';
import 'package:bestyamete/utils/category.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as developer;

import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get_it/get_it.dart';

import '../../utils/connectivity.dart';
import '../../utils/helpers.dart';
import '../../utils/persistence.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? currentSelection;

  @override
  Widget build(BuildContext context) {
    final content = context.watch<PopularBloc>().state;
    final episodes = context.watch<LatestBloc>().state;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Bookmarks()),
            );
          },
          child: Icon(Icons.bookmark),
        ),
        appBar: AppBar(
          title: Text('Yamete Oniichan'),
          actions: [
            IconButton(
                onPressed: () async {
                  await showSearch(
                      context: context, delegate: AnimeSearchDelegate());
                },
                icon: Icon(Icons.search))
          ],
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Episódios',
              ),
              Tab(text: 'Populares'),
              Tab(text: 'Categorias')
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: episodes.when(
                  initial: () => Container(),
                  loading: () => Center(
                        child: CircularProgressIndicator(),
                      ),
                  loaded: (_) => AnimeListHorizontal(data: _, isEpisode: true),
                  error: () => Center(
                        child: FlutterLogo(),
                      )),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: content.when(
                  initial: () => Container(),
                  loading: () => Center(
                        child: CircularProgressIndicator(),
                      ),
                  loaded: (_) => AnimeListHorizontal(data: _, isEpisode: false),
                  error: () => Center(
                        child: FlutterLogo(),
                      )),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Text('Categoria'),
                        SizedBox(
                          width: 10,
                        ),
                        DropdownButton(
                          items: Categories.itens,
                          hint: Text('Pressione e veja o que acontece'),
                          value: currentSelection ?? null,
                          onChanged: (value) {
                            // context
                            //     .read<SearchBloc>()
                            //     .add(SearchEvent.started());
                            context.read<SearchBloc>().add(SearchEvent.load(
                                value.toString(), SearchType.category));
                            setState(() {
                              currentSelection = value.toString();
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: context.watch<SearchBloc>().state.when(
                            initial: () => Center(
                              child: Text('Nada para mostrar'),
                            ),
                            loading: () => Center(
                              child: CircularProgressIndicator(),
                            ),
                            error: () => FlutterLogo(),
                            loaded: (_) => GridView.builder(
                              itemCount: _.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 1,
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10,
                                      childAspectRatio: 16 / 9),
                              itemBuilder: (context, index) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: GestureDetector(
                                    onTap: () async {
                                      if (await ConnectivityHelper
                                          .isOnline()) {}
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
                                                    DataHelpers.baseImageUrl +
                                                        _[index].categoryImage!,
                                                httpHeaders:
                                                    DataHelpers.baseHeaders,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Expanded(
                                              flex: 6,
                                              child: Column(
                                                children: [
                                                  Align(
                                                      alignment:
                                                          Alignment.topRight,
                                                      child:
                                                          ValueListenableBuilder(
                                                        valueListenable: GetIt.I<
                                                                PersistenceHelper>()
                                                            .notifier,
                                                        builder: (BuildContext
                                                                context,
                                                            value,
                                                            Widget? child) {
                                                          var favs = GetIt.I<
                                                                  PersistenceHelper>()
                                                              .favoritos;
                                                          return favs
                                                                  .containsKey(
                                                                      _[index]
                                                                          .id!)
                                                              ? IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    GetIt.I<PersistenceHelper>()
                                                                        .toggleFavorite(
                                                                            _[index]);
                                                                  },
                                                                  icon: Icon(Icons
                                                                      .favorite))
                                                              : IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    GetIt.I<PersistenceHelper>()
                                                                        .toggleFavorite(
                                                                            _[index]);
                                                                  },
                                                                  icon: Icon(Icons
                                                                      .favorite_outline));
                                                        },
                                                      )),
                                                  Expanded(
                                                      child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 15.0,
                                                            right: 15.0,
                                                            top: 12.0),
                                                    child: Text(
                                                      _[index].categoryName!,
                                                      softWrap: false,
                                                      maxLines: 4,
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          overflow: TextOverflow
                                                              .ellipsis),
                                                    ),
                                                  ))
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
