import 'package:bestyamete/utils/helpers.dart';
import 'package:dio/dio.dart';

class DownloaderInterceptor extends Interceptor{

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll(DataHelpers.baseHeaders);
  }
}