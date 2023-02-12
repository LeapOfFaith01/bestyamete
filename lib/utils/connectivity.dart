import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityHelper{

  static Future<bool> isOnline ()async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }else {
      return false;
    }
  }
}