import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_news_app/app/shared/api_key.dart';
import 'package:flutter_news_app/app/shared/constants.dart';
import 'package:flutter_news_app/app/shared/constants/categories.dart';
import 'package:flutter_news_app/app/shared/http/custom_dio.dart';
import 'package:flutter_news_app/app/shared/models/articles_response_model.dart';
import 'package:flutter_news_app/app/shared/models/query_model.dart';

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

  Future<ArticlesResponseModel> getTopHeadlinesFromCategory(
      String category) async {
    String url = ApiUrls.topHeadlines;

    Map<String, dynamic> params = {
      'apiKey': API_KEY,
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
      'apiKey': API_KEY,
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
