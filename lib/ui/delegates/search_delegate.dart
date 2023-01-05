import 'package:bestyamete/bloc/detail/detail_bloc.dart';
import 'package:bestyamete/ui/pages/detail_page.dart';
import 'package:bestyamete/ui/widgets/anime_list_horizontal.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/search/search_bloc.dart';
import '../../bloc/streaming/streaming_bloc.dart';
import '../../utils/helpers.dart';
import '../pages/stream_page.dart';
class AnimeSearchDelegate extends SearchDelegate<String>{

  // SearchState getState(context) => context.watch<SearchBloc>().state;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: () => query = '')];
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return  Theme.of(context);
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () => close(context, ''),
    );
  }

  @override
  Widget buildResults(BuildContext context) {

    if(query.isNotEmpty)context.read<SearchBloc>().add(SearchEvent.load(query,SearchType.name));

    return BlocBuilder<SearchBloc,SearchState>(
      builder: (context, state){
        return state.when(
            initial: () => Container(),
            loading: () =>Center(child: CircularProgressIndicator(),),
            error: () =>FlutterLogo(),
            loaded: (_) => GridView.builder(
              itemCount: _.length,
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                childAspectRatio: 9/16,
                crossAxisSpacing: 10
              ),
              itemBuilder: (context, index)=> GestureDetector(
                onTap: (){
                  context.read<DetailBloc>().add(DetailEvent.load(_[index].id!));
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailPage()),
                  );
                },
                child: GridTile(
                    footer: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 5,left: 5,right: 5),
                        child: Text(_[index].title == null ? _[index].categoryName! : _[index].title!,textAlign: TextAlign.start,),
                      ),
                    ),
                    child:
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: ClipRRect(borderRadius:BorderRadius.circular(15),child: CachedNetworkImage(imageUrl: DataHelpers.baseImageUrl+_[index].categoryImage!,httpHeaders: DataHelpers.baseHeaders,fit: BoxFit.cover,)),
                    )
                ),
              ),
            ));
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.tv),
      title: Text('Digite o nome do seu anime ex: Black Clover'),
    );
  }
  @override
  String get searchFieldLabel => 'Busca';
}

class CustomLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const CustomLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'en';

  @override
  Future<MaterialLocalizations> load(Locale locale) =>
      SynchronousFuture<MaterialLocalizations>(const CustomLocalization());

  @override
  bool shouldReload(CustomLocalizationDelegate old) => false;

  @override
  String toString() => 'CustomLocalization.delegate(en_US)';
}

class CustomLocalization extends DefaultMaterialLocalizations {
  const CustomLocalization();

  @override
  String get searchFieldLabel => "My hint text";
}

