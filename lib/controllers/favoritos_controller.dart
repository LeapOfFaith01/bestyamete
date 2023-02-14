import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import '../models/api_interfaces.dart';
import '../utils/persistence.dart';

class FavoritosController{
  late PersistenceHelper persistenceHelper;

  ValueNotifier<int> notifier = ValueNotifier<int>(0);

  void initialize() async {
    persistenceHelper = GetIt.I<PersistenceHelper>();
  }
  void toggleFavorite(Anime data){
    persistenceHelper.toggleFavorite(data);
  }
}