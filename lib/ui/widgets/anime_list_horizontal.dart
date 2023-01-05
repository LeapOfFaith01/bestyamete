import 'package:bestyamete/bloc/detail/detail_bloc.dart';
import 'package:bestyamete/bloc/index.dart';
import 'package:bestyamete/ui/pages/detail_page.dart';
import 'package:bestyamete/ui/pages/stream_page.dart';
import 'package:bestyamete/utils/helpers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as developer;

import '../../models/api_interfaces.dart';

class AnimeListHorizontal extends StatelessWidget {
  final List<Anime> data;
  bool isEpisode = false;
  AnimeListHorizontal({Key? key,bool this.isEpisode = false, required List<Anime> this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 10/16),
        delegate: SliverChildBuilderDelegate(

          childCount: data.length,
            (_,__) =>ClipRRect(
              borderRadius: BorderRadius.circular(15),
                child: GestureDetector(
                  onTap: (){
                    if(!isEpisode){
                      data[__].id == null ? context.read<DetailBloc>().add(DetailEvent.load(data[__].categoryId!)) : context.read<DetailBloc>().add(DetailEvent.load(data[__].id!));
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const DetailPage()),
                      );
                    }else{
                      if(data[__].videoId != null){
                       context.read<StreamingBloc>().add(StreamingEvent.load(data[__].videoId!));
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => StreamPage()),
                                          );
                      }
                    }
                  },
                  child: GridTile(
                      footer: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 5,left: 5,right: 5),
                          child: Text(data[__].title == null ? data[__].categoryName! : data[__].title!,textAlign: TextAlign.start,),
                        ),
                      ),
                      child:
                           Padding(
                             padding: const EdgeInsets.only(bottom: 50),
                             child: ClipRRect(borderRadius:BorderRadius.circular(15),child: CachedNetworkImage(imageUrl: DataHelpers.baseImageUrl+data[__].categoryImage!,httpHeaders: DataHelpers.baseHeaders,fit: BoxFit.cover,)),
                           )
                    ),
                ),
                ),
              ),
            );
  }
}
