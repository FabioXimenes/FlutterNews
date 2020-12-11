import 'package:dio/dio.dart';
import 'package:flutter_news_app/app/shared/models/article_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'articles_response_model.g.dart';

@JsonSerializable()
class ArticlesResponseModel {
  String status;
  String code;
  String message;
  int totalResults;
  List<ArticleModel> articles;

  ArticlesResponseModel(
      this.status, this.code, this.message, this.totalResults, this.articles);

  factory ArticlesResponseModel.fromJson(Map<String, dynamic> json) => _$ArticlesResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$ArticlesResponseModelToJson(this);

  ArticlesResponseModel.withError(DioError error) {
    status = 'error';
    code = error.response.statusCode.toString();
    message = error.message;
    totalResults = 0;
    articles = <ArticleModel>[];
  }
}
