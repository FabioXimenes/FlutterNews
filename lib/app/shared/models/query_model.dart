import 'package:json_annotation/json_annotation.dart';

part 'query_model.g.dart';

@JsonSerializable()
class QueryModel {
  String message;
  String from;
  String to;
  String sortBy;

  QueryModel({
    this.message,
    this.from,
    this.to,
    this.sortBy,
  });

  factory QueryModel.fromJson(Map<String, dynamic> json) =>
      _$QueryModelFromJson(json);

  Map<String, dynamic> toJson() => _$QueryModelToJson(this);
}
