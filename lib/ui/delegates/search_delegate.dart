import 'package:bestyamete/ui/widgets/anime_list_horizontal.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/search/search_bloc.dart';

class AnimeSearchDelegate extends SearchDelegate<String> {
  // SearchState getState(context) => context.watch<SearchBloc>().state;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: () => query = '')];
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context);
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
    if (query.isNotEmpty)
      context.read<SearchBloc>().add(SearchEvent.load(query, SearchType.name));

    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return state.when(
            initial: () => Container(),
            loading: () => Center(
                  child: CircularProgressIndicator(),
                ),
            error: () => FlutterLogo(),
            loaded: (_) => _.isEmpty
                ? Center(
                    child: Text('Nada foi encontrado :/'),
                  )
                : AnimeListHorizontal(data: _));
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
