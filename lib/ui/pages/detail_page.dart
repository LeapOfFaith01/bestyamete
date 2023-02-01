import 'dart:developer' as developer;
import 'package:bestyamete/bloc/index.dart';
import 'package:bestyamete/mob/download_mob_controller.dart';
import 'package:bestyamete/ui/pages/stream_page.dart';
import 'package:bestyamete/ui/widgets/build_download_actions.dart';
import 'package:bestyamete/utils/helpers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../main.dart';
import '../../models/download_item.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<DetailBloc>().state;
    return state.when(
        initial: () => Container(),
        loading: () => Material(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        error: () => Container(),
        loaded: (_, __) {
          developer.log(_.toString());
          developer.log(__.toString());
          return Scaffold(
            appBar: AppBar(
              title: Text(_.categoryName!),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: ListView(
              padding: EdgeInsets.all(15),
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * .40,
                    child: CachedNetworkImage(
                      httpHeaders: DataHelpers.baseHeaders,
                      imageUrl: DataHelpers.baseImageUrl + _.categoryImage!,
                      placeholder: (_, __) => CircularProgressIndicator(),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Text('Descrição:',
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 2,
                    )),
                Text(_.categoryDescription!),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text('Generos:',
                          style: TextStyle(
                            fontSize: 20,
                            letterSpacing: 2,
                          )),
                    ),
                    Text('Ano: ${_.ano!}',
                        style: TextStyle(
                          fontSize: 20,
                          letterSpacing: 2,
                        ))
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: _.categoryGenres!
                      .split(',')
                      .map((e) => Text(e.toString().trim()))
                      .toList(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text('Episódios:',
                      style: TextStyle(
                        fontSize: 30,
                        letterSpacing: 2,
                      )),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .50,
                  child: ListView.builder(
                    itemCount: __.length,
                    itemBuilder: (_, index) => ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: ListTile(
                          onTap: () {
                            context
                                .read<StreamingBloc>()
                                .add(StreamingEvent.load(__[index].videoId!));
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StreamPage()),
                            );
                          },
                          title: Text(__[index].title!),
                          trailing: ValueListenableBuilder(
                              valueListenable:
                                  getIt<DownloadMobController>().notifier,
                              builder: (context, notifier, child) {
                                var queue = getIt<DownloadMobController>()
                                    .queue
                                    .toList();
                                var item = queue.firstWhere(
                                    (element) =>
                                        element.videoId == __[index].videoId!,
                                    orElse: () => DownloadItem(
                                        name: '', url: '', videoId: ''));
                                return item.videoId == __[index].videoId!
                                    ? buildActionForTask(item)
                                    : IconButton(
                                        onPressed: () {
                                          getIt<DownloadMobController>()
                                              .addDownload(__[index].videoId!);
                                        },
                                        icon: Icon(Icons.download));
                              })),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}

// class DetailPage extends StatelessWidget {
//   const DetailPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final state = context.watch<DetailBloc>().state;
//     return state.when(
//         initial: () => Material(),
//         loading: () => Material(
//               child: CircularProgressIndicator(),
//             ),
//         error: () => Material(
//               child: Center(
//                 child: FlutterLogo(),
//               ),
//             ),
//         loaded: (_, __) => Scaffold(
//           appBar: AppBar(
//             title: Text(_.categoryName!),
//           ),
//           body: Column(
//             children: [
//               Expanded(
//                   flex:3,child: Row(
//                 children: [
//                   Expanded(flex:6,child: CachedNetworkImage(httpHeaders: DataHelpers.baseHeaders, imageUrl: '${DataHelpers.baseImageUrl}/${_.categoryImage}',fit: BoxFit.cover,)),
//                   Expanded(flex:4,child: Text('TITULO DO ANIME PORRA'))
//                 ],
//               )),
//               Expanded(
//                 flex: 2,
//                 child: Text('AA')
//               )
//             ],
//           ),
//         ));
//   }
// }
