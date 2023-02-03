import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bestyamete/models/api_interfaces.dart';

part 'favoritos_mob_controller.g.dart';

class FavoritosController = Favoritos
    with _$FavoritosController;

abstract class Favoritos with Store {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late final SharedPreferences prefs;
  Map<String, Anime> favoritos = {};

  ValueNotifier<int> notifier = ValueNotifier<int>(0);
  
  void initialize() async {
    prefs = await _prefs;
    recoveryFromStorage();
  }

  void recoveryFromStorage()  {
    if(prefs.getKeys().contains('favoritos')){
      favoritos = json.decode(
        prefs.getString('favoritos')!
      ).map((key,value){
        return MapEntry(key, Anime.fromJson(value));
      }).cast<String, Anime>();
    }
  }
  void _updateStorage(){
    print('Message favoritos ${json.encode(favoritos)}');
    prefs.setString("favoritos",json.encode(favoritos));
  }
  void toggleFavorite(Anime data){
    if(favoritos.containsKey(data.id)) favoritos.remove(data.id);
    else {
      favoritos[data.id!] = data;
    }
    _updateStorage();
    notifier.value = notifier.value++;
  }
}