// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articles_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticlesResponseModel _$ArticlesResponseModelFromJson(
    Map<String, dynamic> json) {
  return ArticlesResponseModel(
    json['status'] as String,
    json['code'] as String,
    json['message'] as String,
    json['totalResults'] as int,
    (json['articles'] as List)
        ?.map((e) =>
            e == null ? null : ArticleModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ArticlesResponseModelToJson(
        ArticlesResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };
