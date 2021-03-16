import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../constants/news_api.dart';
import '../http/custom_dio.dart';
import '../models/articles_response_model.dart';
import '../models/query_model.dart';

class ArticleRepository {
  final CustomDio _client = Modular.get();

  Future<ArticlesResponseModel> getTopHeadlines() async {
    String url = ApiUrls.topHeadlines;

    Map<String, dynamic> params = {
      'apiKey': env['API_KEY'],
      'country': 'us',
    };

    try {
      Response response = await _client.get(url, queryParameters: params);
      return ArticlesResponseModel.fromJson(response.data);
    } on DioError catch (e) {
      return ArticlesResponseModel.withError(e);
    }
  }

  Future<ArticlesResponseModel> getTopHeadlinesFromCategory(
      String category) async {
    String url = ApiUrls.topHeadlines;

    Map<String, dynamic> params = {
      'apiKey': env['API_KEY'],
      'country': 'us',
      'category': category,
    };

    try {
      Response response = await _client.get(url, queryParameters: params);
      return ArticlesResponseModel.fromJson(response.data);
    } on DioError catch (e) {
      return ArticlesResponseModel.withError(e);
    }
  }

  Future<ArticlesResponseModel> getArticlesByFilter(QueryModel query) async {
    String url = ApiUrls.everything;

    Map<String, dynamic> params = {
      'apiKey': env['API_KEY'],
      'q': query.message.toLowerCase(),
      'sortBy': query.sortBy,
      'language': 'en',
    };

    if (query.from != null) {
      params['from'] = query.from;
    }

    if (query.to != null) {
      params['to'] = query.to;
    }    

    try {
      Response response = await _client.get(url, queryParameters: params);
      return ArticlesResponseModel.fromJson(response.data);
    } on DioError catch (e) {
      return ArticlesResponseModel.withError(e);
    }
  }
}
