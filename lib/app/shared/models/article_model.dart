import 'package:json_annotation/json_annotation.dart';

import 'source_model.dart';

part 'article_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ArticleModel {
  SourceModel source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  ArticleModel(this.source, this.author, this.title, this.description, this.url,
      this.urlToImage, this.publishedAt, this.content);

  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleModelToJson(this);
}
