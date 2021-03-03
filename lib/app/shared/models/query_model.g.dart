// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryModel _$QueryModelFromJson(Map<String, dynamic> json) {
  return QueryModel(
    message: json['message'] as String,
    from: json['from'] == null ? null : DateTime.parse(json['from'] as String),
    to: json['to'] == null ? null : DateTime.parse(json['to'] as String),
    sortBy: json['sortBy'] as String,
  );
}

Map<String, dynamic> _$QueryModelToJson(QueryModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'from': instance.from?.toIso8601String(),
      'to': instance.to?.toIso8601String(),
      'sortBy': instance.sortBy,
    };
