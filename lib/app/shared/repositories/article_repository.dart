import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_news_app/app/shared/api_key.dart';
import 'package:flutter_news_app/app/shared/constants.dart';
import 'package:flutter_news_app/app/shared/http/custom_dio.dart';
import 'package:flutter_news_app/app/shared/models/articles_response_model.dart';

class ArticleRepository {
  final CustomDio _client = Modular.get();

  Future<ArticlesResponseModel> getTopHeadlines() async {
    String url = ApiUrls.topHeadlines;

    Map<String, dynamic> params = {
      'apiKey': API_KEY,
      'country': 'us',
    };

    try {
      Response response = await _client.get(url, queryParameters: params);
      return ArticlesResponseModel.fromJson(response.data);
    } on DioError catch (e) {
      return ArticlesResponseModel.withError(e);
    }
  }
}
