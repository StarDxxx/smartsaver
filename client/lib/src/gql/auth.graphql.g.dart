// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Variables$Mutation$Login _$Variables$Mutation$LoginFromJson(
        Map<String, dynamic> json) =>
    Variables$Mutation$Login(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$Variables$Mutation$LoginToJson(
        Variables$Mutation$Login instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

Mutation$Login _$Mutation$LoginFromJson(Map<String, dynamic> json) =>
    Mutation$Login(
      tokenAuth: json['tokenAuth'] == null
          ? null
          : Mutation$Login$tokenAuth.fromJson(
              json['tokenAuth'] as Map<String, dynamic>),
      $__typename: json['__typename'] as String,
    );

Map<String, dynamic> _$Mutation$LoginToJson(Mutation$Login instance) =>
    <String, dynamic>{
      'tokenAuth': instance.tokenAuth?.toJson(),
      '__typename': instance.$__typename,
    };

Mutation$Login$tokenAuth _$Mutation$Login$tokenAuthFromJson(
        Map<String, dynamic> json) =>
    Mutation$Login$tokenAuth(
      token: json['token'] as String,
      refreshToken: json['refreshToken'] as String,
      $__typename: json['__typename'] as String,
    );

Map<String, dynamic> _$Mutation$Login$tokenAuthToJson(
        Mutation$Login$tokenAuth instance) =>
    <String, dynamic>{
      'token': instance.token,
      'refreshToken': instance.refreshToken,
      '__typename': instance.$__typename,
    };
