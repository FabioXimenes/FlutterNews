// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthModel _$AuthModelFromJson(Map<String, dynamic> json) {
  return AuthModel(
    email: json['email'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$AuthModelToJson(AuthModel instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
