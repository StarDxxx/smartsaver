// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Variables$Query$Users _$Variables$Query$UsersFromJson(
        Map<String, dynamic> json) =>
    Variables$Query$Users(
      name: json['name'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$Variables$Query$UsersToJson(
        Variables$Query$Users instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
    };

Query$Users _$Query$UsersFromJson(Map<String, dynamic> json) => Query$Users(
      users: (json['users'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Query$Users$users.fromJson(e as Map<String, dynamic>))
          .toList(),
      $__typename: json['__typename'] as String,
    );

Map<String, dynamic> _$Query$UsersToJson(Query$Users instance) =>
    <String, dynamic>{
      'users': instance.users?.map((e) => e?.toJson()).toList(),
      '__typename': instance.$__typename,
    };

Query$Users$users _$Query$Users$usersFromJson(Map<String, dynamic> json) =>
    Query$Users$users(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      mutualFriends: (json['mutualFriends'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Query$Users$users$mutualFriends.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
      $__typename: json['__typename'] as String,
    );

Map<String, dynamic> _$Query$Users$usersToJson(Query$Users$users instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'mutualFriends': instance.mutualFriends?.map((e) => e?.toJson()).toList(),
      '__typename': instance.$__typename,
    };

Query$Users$users$mutualFriends _$Query$Users$users$mutualFriendsFromJson(
        Map<String, dynamic> json) =>
    Query$Users$users$mutualFriends(
      name: json['name'] as String,
      $__typename: json['__typename'] as String,
    );

Map<String, dynamic> _$Query$Users$users$mutualFriendsToJson(
        Query$Users$users$mutualFriends instance) =>
    <String, dynamic>{
      'name': instance.name,
      '__typename': instance.$__typename,
    };
