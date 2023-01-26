import 'package:bestyamete/bloc/index.dart';
import 'package:bestyamete/mob/download_mob_controller.dart';
import 'package:bestyamete/modules/download_cubit.dart';
import 'package:bestyamete/modules/downloadcontroller.dart';
import 'package:bestyamete/ui/pages/detail_page.dart';
import 'package:bestyamete/ui/pages/home_page.dart';
import 'package:bestyamete/ui/pages/stream_page.dart';
import 'package:bestyamete/utils/helpers.dart';
import 'package:bestyamete/utils/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get_it/get_it.dart';
GetIt getIt = GetIt.instance;
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(debug: true, ignoreSsl: true);
  getIt.registerSingleton<DownloadMobController>(DownloadMobController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => LatestBloc()),
      BlocProvider(create: (_) => DetailBloc()),
      BlocProvider(create: (_) => PopularBloc()),
      BlocProvider(create: (_) => SearchBloc()),
      BlocProvider(create: (_) => StreamingBloc(),),
      BlocProvider(create: (_)=> DownloadCubit())
    ], child: MaterialApp(
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
    context.read<LatestBloc>().add(const LatestEvent.load());
    context.read<PopularBloc>().add(const PopularEvent.load());
    getIt<DownloadMobController>().initialize();
    // context.read<DownloadCubit>().initialize();
  }

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}



