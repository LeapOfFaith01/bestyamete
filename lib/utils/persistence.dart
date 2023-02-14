import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/api_interfaces.dart';
import '../models/download_item.dart';

class PersistenceHelper{
  ValueNotifier<int> notifier = ValueNotifier(0);

  notify(){
    notifier.value++;
  }

  Map<String, DownloadItem> downloads = {};
  Map<String, Detalhes> detalhes ={};
  Map<String,Anime> favoritos = {};

  final Future<SharedPreferences> _prefsInstance =
  SharedPreferences.getInstance();

  late final SharedPreferences _prefs;

  void initializePersistenceModule() async {
    _prefs = await _prefsInstance;
    _recoveryFromStorage();
  }

  //Recovery and parse data from storage
  void _recoveryFromStorage() {
    if (_prefs.getKeys().contains('downloads')) {
      downloads =
          json.decode(_prefs.getString('downloads')!).map((key, value) {
            return MapEntry(key, DownloadItem.fromJson(value));
          }).cast<String, DownloadItem>();
    }
    if (_prefs.getKeys().contains('detalhes')) {
      detalhes =
          json.decode(_prefs.getString('detalhes')!).map((key, value) {
            return MapEntry(key, Detalhes.fromJson(value));
          }).cast<String, Detalhes>();
    }
    if (_prefs.getKeys().contains('favoritos')) {
      favoritos =
          json.decode(_prefs.getString('favoritos')!).map((key, value) {
            return MapEntry(key, Anime.fromJson(value));
          }).cast<String, Anime>();
    }
  }

  void registerOfflineDetailPage(){
    _prefs.setString('detalhes', json.encode(detalhes));
    print(detalhes);
    notify();
  }

  void update() {
    _prefs.setString('downloads', json.encode(downloads));
    notify();
  }

  void _updateStorage(){
    _prefs.setString("favoritos",json.encode(favoritos));
    notify();
  }

  void toggleFavorite(Anime data){
    if(favoritos.containsKey(data.id)) favoritos.remove(data.id);
    else {
      favoritos[data.id!] = data;
    }
    _updateStorage();
    // notifier.value = notifier.value++;
  }
}