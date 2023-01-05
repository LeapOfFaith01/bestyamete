import 'package:bestyamete/bloc/index.dart';
import 'package:bestyamete/utils/helpers.dart';
import 'package:better_player_hls/better_player_hls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StreamPage extends StatelessWidget {
  StreamPage({Key? key}) : super(key: key);

  GlobalKey _betterKey = GlobalKey();
  late BetterPlayerController betterPlayerController;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<StreamingBloc>().state;
    return state.when(
        initial:()=> Container(),
        loading: ()=>Material(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        error: () => FlutterLogo(),
        loaded: (_,__) {
          initializeController(_);
          return Scaffold(
              appBar: AppBar(
                title: Text(_.title!),
              ),
              body:Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: AspectRatio(
                      aspectRatio: 16/9,
                      child: BetterPlayer(
                        controller: betterPlayerController,
                        key: _betterKey,
                      ),
                    ),
                  ),
                  __.videoId != null ? TextButton(onPressed: (){
                    context.read<StreamingBloc>().add(StreamingEvent.load(__.videoId!));
                  }, child: Row(
                    children: [
                      Text(__.title!),
                      Icon(Icons.skip_next)
                    ],
                  )): Container()
                ],
              ));});
}
//Foward 90s to skin anime opening
  void skipOpen() async {
    var duration = await betterPlayerController.videoPlayerController!.position;
    betterPlayerController.seekTo( duration! + Duration(seconds: 90));
  }
  //Initialize BetterPlayerController
  //The parameter is the data used to fill the controller retrieved from StreamingBlocState
  void initializeController(_){
    BetterPlayerDataSource betterPlayerDataSource;

    //If have two data sources initialize with two video quality options
    if(_.location!.isNotEmpty && _.locationsd!.isNotEmpty ){
      betterPlayerDataSource = BetterPlayerDataSource(
          BetterPlayerDataSourceType.network,
          _.location == null ? _.locationsd! : _.location!,headers: DataHelpers.baseHeaders,
          resolutions: {
            "SD":_.location!,
            "HD":_.locationsd!
          },
          notificationConfiguration: BetterPlayerNotificationConfiguration(
              showNotification: true,
              title: _.title!,
              author: "Yamete Kudasai"
          ));

      //If only have one data source initialize with only one video quality option
    }else{
      betterPlayerDataSource = BetterPlayerDataSource(
          BetterPlayerDataSourceType.network,
          _.location == null ? _.locationsd! : _.location!,headers: DataHelpers.baseHeaders,
          notificationConfiguration: BetterPlayerNotificationConfiguration(
              showNotification: true,
              title: _.title!,
              author: "Yamete Kudasai"
          ));
    }
    //Setup controller
    betterPlayerController = BetterPlayerController(
        BetterPlayerConfiguration(
            allowedScreenSleep: false,
            autoDetectFullscreenDeviceOrientation: true,
            autoPlay: true,
            autoDispose: true,
            handleLifecycle: true,
            controlsConfiguration: BetterPlayerControlsConfiguration(
                enableSubtitles: false,
                enablePlaybackSpeed: false,
                enablePip: false,
                enableAudioTracks: false,
                progressBarBufferedColor: Colors.blue,
                overflowMenuCustomItems: [
                  BetterPlayerOverflowMenuItem(
                      Icons.skip_next_outlined,
                      'Pular abertura (90s)',
                          (){
                        skipOpen();
                      }
                  )
                ]
            )
        ),
        betterPlayerDataSource: betterPlayerDataSource);
  }}

