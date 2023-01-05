import 'package:bestyamete/bloc/index.dart';
import 'package:bestyamete/ui/delegates/search_delegate.dart';
import 'package:bestyamete/ui/widgets/anime_list_horizontal.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as developer;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final content = context.watch<PopularBloc>().state;
    final episodes = context.watch<LatestBloc>().state;
    return Scaffold(
      appBar: AppBar(
          title: Text('Yamete Kudasai'),
        actions: [
          IconButton(onPressed: () async {
            await showSearch(context: context, delegate: AnimeSearchDelegate());
          }, icon: Icon(Icons.search))
        ],
        ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 1,
            pinned: true,
            title: Text('Episodios Recentes'),
          ),
          const SliverPadding(padding: EdgeInsets.symmetric(vertical: 20)),
          episodes.when(
            initial: () => SliverToBoxAdapter(),
            loading: () =>
                SliverToBoxAdapter(child: CircularProgressIndicator()),
            error: () => SliverToBoxAdapter(child: FlutterLogo()),
            loaded: (_) {
              developer.log(_.toString());
              return SliverPadding(
                padding: EdgeInsets.all(10),
                sliver: AnimeListHorizontal(
                  data: _,
                  isEpisode: true,
                ),
              );
            },
          ),
          SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 1,
            pinned: true,
            title: Text('Animes Populares'),
          ),
          const SliverPadding(padding: EdgeInsets.symmetric(vertical: 20)),
          content.when(
            initial: () => SliverToBoxAdapter(),
            loading: () =>
                SliverToBoxAdapter(child: CircularProgressIndicator()),
            error: () => SliverToBoxAdapter(child: FlutterLogo()),
            loaded: (_) => SliverPadding(
              padding: EdgeInsets.all(10),
              sliver: AnimeListHorizontal(
                data: _,
                isEpisode: false,
              )
            ),
          ),
        ],
      ),
    );
  }
}