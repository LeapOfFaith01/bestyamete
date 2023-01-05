import 'dart:developer' as developer;
import 'package:bestyamete/bloc/detail/detail_bloc.dart';
import 'package:bestyamete/bloc/index.dart';
import 'package:bestyamete/ui/pages/stream_page.dart';
import 'package:bestyamete/utils/helpers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<DetailBloc>().state;
    return state.when(
        initial: ()=>Container(),
        loading: ()=>Material(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        error: ()=>Container(),
        loaded: (_,__) {
          developer.log(_.toString());
          developer.log(__.toString());
          return Scaffold(
            appBar: AppBar(title: Text(_.categoryName!),backgroundColor: Colors.transparent,elevation: 0,),
            body: ListView(
              padding: EdgeInsets.all(15),
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height *.40,
                    child: CachedNetworkImage(
                      httpHeaders: DataHelpers.baseHeaders,
                      imageUrl:DataHelpers.baseImageUrl + _.categoryImage!,
                      placeholder: (_,__)=> CircularProgressIndicator(),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Text('Descrição:',style: TextStyle(fontSize: 20,letterSpacing: 2,)),
                Text(_.categoryDescription!),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text('Generos:',style: TextStyle(fontSize: 20,letterSpacing: 2,)),
                    ),
                    Text('Ano:'+ _.ano!,style: TextStyle(fontSize: 20,letterSpacing: 2,))
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: _.categoryGenres!.split(',').map((e) => Text(e.toString().trim())).toList(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text('Episódios:',style: TextStyle(fontSize: 30,letterSpacing: 2,)),
                ),
                Container(
                  height: MediaQuery.of(context).size.height *.50,
                  child: ListView.builder(
                    itemCount: __.length,
                    itemBuilder: (_, index) => ListTile(
                      trailing: Icon(Icons.play_circle_outline,size: 45),
                      title: Text(__[index].title!),
                      onTap: (){
                        context.read<StreamingBloc>().add(StreamingEvent.load(__[index].videoId!));
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  StreamPage()),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
