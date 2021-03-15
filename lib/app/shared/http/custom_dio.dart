import 'package:dio/native_imp.dart';

import '../constants/news_api.dart';
import 'interceptors.dart/custom_interceptors.dart';

class CustomDio extends DioForNative {
  CustomDio() {
    options.baseUrl = BASE_URL;
    options.connectTimeout = 10000;
    interceptors.add(CustomInterceptors());
  }
}
