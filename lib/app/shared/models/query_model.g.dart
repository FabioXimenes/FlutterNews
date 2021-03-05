// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryModel _$QueryModelFromJson(Map<String, dynamic> json) {
  return QueryModel(
    message: json['message'] as String,
    from: json['from'] as String,
    to: json['to'] as String,
    sortBy: json['sortBy'] as String,
  );
}

Map<String, dynamic> _$QueryModelToJson(QueryModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'from': instance.from,
      'to': instance.to,
      'sortBy': instance.sortBy,
    };
