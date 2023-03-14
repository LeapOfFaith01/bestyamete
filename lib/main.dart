import 'package:bestyamete/bloc/index.dart';
import 'package:bestyamete/controllers/download_controller.dart';
import 'package:bestyamete/ui/pages/home_page.dart';
import 'package:bestyamete/utils/persistence.dart';
import 'package:bestyamete/utils/theme.dart';
import 'package:easy_downloader/easy_downloader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get_it/get_it.dart';

import 'controllers/easy_controller.dart';
import 'controllers/favoritos_controller.dart';
import 'controllers/flutter_downloader_manager_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FlutterDownloader.initialize(ignoreSsl: true);
  // await EasyDownloader.init(startQueue: true, maxConcurrentTasks: 4);

  GetIt.I.registerSingleton<FlutterDownloaderDownloadController>(FlutterDownloaderDownloadController());
  GetIt.I.registerSingleton<PersistenceHelper>(PersistenceHelper());
  GetIt.I.registerSingleton<FavoritosController>(FavoritosController());
  // GetIt.I.registerSingleton<EasyDownloaderController>(EasyDownloaderController());
  // GetIt.I.registerSingleton<FlutterDownloaderManagerController>(FlutterDownloaderManagerController());

  // DateTime toWork = DateTime.parse('2023-02-20 11:47:00').add(Duration(days: 50));
  // if(toWork.isAfter(DateTime.now())){
  //   runApp(MyApp());
  // }else{
  //   runApp(ExpiredApp());
  // }


  runApp(MyApp());
}
class ExpiredApp extends StatelessWidget {
  const ExpiredApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Yamete Kudasai'),
        ),
        body: Center(
          child: Text('Está versão do aplicativo está obsoleta. Por favor busque uma atualização em nosso discord.'),
        ),
      ),
    );
  }
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
          debugShowCheckedModeBanner: false,
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
    GetIt.I<FlutterDownloaderDownloadController>().initialize();
    GetIt.I<FavoritosController>().initialize();
    // GetIt.I<EasyDownloaderController>().initialize();
    // GetIt.I<FlutterDownloaderManagerController>().initialize();
    // context.read<DownloadCubit>().initialize();
  }

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
