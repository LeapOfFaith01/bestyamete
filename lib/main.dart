import 'package:bestyamete/bloc/index.dart';
import 'package:bestyamete/controllers/DownloadController.dart';
import 'package:bestyamete/mob/download_mob_controller.dart';
import 'package:bestyamete/mob/favoritos_mob_controller.dart';
import 'package:bestyamete/ui/pages/home_page.dart';
import 'package:bestyamete/utils/persistence.dart';
import 'package:bestyamete/utils/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FlutterDownloader.initialize(ignoreSsl: true);

  GetIt.I.registerSingleton<DownloadController>(DownloadController());
  GetIt.I.registerSingleton<FavoritosController>(FavoritosController());
  GetIt.I.registerSingleton<PersistenceHelper>(PersistenceHelper());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => LatestBloc()),
          BlocProvider(create: (_) => DetailBloc()),
          BlocProvider(create: (_) => PopularBloc()),
          BlocProvider(create: (_) => SearchBloc()),
          BlocProvider(
            create: (_) => StreamingBloc(),
          ),
        ],
        child: MaterialApp(
          // debugShowCheckedModeBanner: false,
          locale: Locale('pt-Br'),
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.dark,
          home: App(),
        ));
  }
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    GetIt.I<PersistenceHelper>().initializePersistenceModule();
    context.read<LatestBloc>().add(const LatestEvent.load());
    context.read<PopularBloc>().add(const PopularEvent.load());
    GetIt.I<DownloadController>().initialize();
    GetIt.I<FavoritosController>().initialize();
    // context.read<DownloadCubit>().initialize();
  }

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
