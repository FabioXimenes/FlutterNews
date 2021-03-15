import 'package:dio/native_imp.dart';
import 'package:flutter_news_app/app/shared/constants/news_api.dart';
import 'package:flutter_news_app/app/shared/http/interceptors.dart/custom_interceptors.dart';

class CustomDio extends DioForNative {
  CustomDio() {
    options.baseUrl = BASE_URL;
    options.connectTimeout = 10000;
    interceptors.add(CustomInterceptors());
  }
}
