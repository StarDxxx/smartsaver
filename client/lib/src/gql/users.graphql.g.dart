// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Variables$Query$FetchUsers _$Variables$Query$FetchUsersFromJson(
        Map<String, dynamic> json) =>
    Variables$Query$FetchUsers(
      name: json['name'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$Variables$Query$FetchUsersToJson(
        Variables$Query$FetchUsers instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
    };

Query$FetchUsers _$Query$FetchUsersFromJson(Map<String, dynamic> json) =>
    Query$FetchUsers(
      users: (json['users'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Query$FetchUsers$users.fromJson(e as Map<String, dynamic>))
          .toList(),
      me: json['me'] == null
          ? null
          : Query$FetchUsers$me.fromJson(json['me'] as Map<String, dynamic>),
      $__typename: json['__typename'] as String,
    );

Map<String, dynamic> _$Query$FetchUsersToJson(Query$FetchUsers instance) =>
    <String, dynamic>{
      'users': instance.users?.map((e) => e?.toJson()).toList(),
      'me': instance.me?.toJson(),
      '__typename': instance.$__typename,
    };

Query$FetchUsers$users _$Query$FetchUsers$usersFromJson(
        Map<String, dynamic> json) =>
    Query$FetchUsers$users(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      mutualFriends: (json['mutualFriends'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Query$FetchUsers$users$mutualFriends.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
      $__typename: json['__typename'] as String,
    );

Map<String, dynamic> _$Query$FetchUsers$usersToJson(
        Query$FetchUsers$users instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'mutualFriends': instance.mutualFriends?.map((e) => e?.toJson()).toList(),
      '__typename': instance.$__typename,
    };

Query$FetchUsers$users$mutualFriends
    _$Query$FetchUsers$users$mutualFriendsFromJson(Map<String, dynamic> json) =>
        Query$FetchUsers$users$mutualFriends(
          name: json['name'] as String,
          $__typename: json['__typename'] as String,
        );

Map<String, dynamic> _$Query$FetchUsers$users$mutualFriendsToJson(
        Query$FetchUsers$users$mutualFriends instance) =>
    <String, dynamic>{
      'name': instance.name,
      '__typename': instance.$__typename,
    };

Query$FetchUsers$me _$Query$FetchUsers$meFromJson(Map<String, dynamic> json) =>
    Query$FetchUsers$me(
      id: json['id'] as String,
      name: json['name'] as String,
      friends: (json['friends'] as List<dynamic>)
          .map((e) =>
              Query$FetchUsers$me$friends.fromJson(e as Map<String, dynamic>))
          .toList(),
      $__typename: json['__typename'] as String,
    );

Map<String, dynamic> _$Query$FetchUsers$meToJson(
        Query$FetchUsers$me instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'friends': instance.friends.map((e) => e.toJson()).toList(),
      '__typename': instance.$__typename,
    };

Query$FetchUsers$me$friends _$Query$FetchUsers$me$friendsFromJson(
        Map<String, dynamic> json) =>
    Query$FetchUsers$me$friends(
      id: json['id'] as String,
      name: json['name'] as String,
      $__typename: json['__typename'] as String,
    );

Map<String, dynamic> _$Query$FetchUsers$me$friendsToJson(
        Query$FetchUsers$me$friends instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      '__typename': instance.$__typename,
    };

Variables$Mutation$AddFriend _$Variables$Mutation$AddFriendFromJson(
        Map<String, dynamic> json) =>
    Variables$Mutation$AddFriend(
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$Variables$Mutation$AddFriendToJson(
        Variables$Mutation$AddFriend instance) =>
    <String, dynamic>{
      'userId': instance.userId,
    };

Mutation$AddFriend _$Mutation$AddFriendFromJson(Map<String, dynamic> json) =>
    Mutation$AddFriend(
      addFriend: json['addFriend'] == null
          ? null
          : Mutation$AddFriend$addFriend.fromJson(
              json['addFriend'] as Map<String, dynamic>),
      $__typename: json['__typename'] as String,
    );

Map<String, dynamic> _$Mutation$AddFriendToJson(Mutation$AddFriend instance) =>
    <String, dynamic>{
      'addFriend': instance.addFriend?.toJson(),
      '__typename': instance.$__typename,
    };

Mutation$AddFriend$addFriend _$Mutation$AddFriend$addFriendFromJson(
        Map<String, dynamic> json) =>
    Mutation$AddFriend$addFriend(
      user: json['user'] == null
          ? null
          : Mutation$AddFriend$addFriend$user.fromJson(
              json['user'] as Map<String, dynamic>),
      $__typename: json['__typename'] as String,
    );

Map<String, dynamic> _$Mutation$AddFriend$addFriendToJson(
        Mutation$AddFriend$addFriend instance) =>
    <String, dynamic>{
      'user': instance.user?.toJson(),
      '__typename': instance.$__typename,
    };

Mutation$AddFriend$addFriend$user _$Mutation$AddFriend$addFriend$userFromJson(
        Map<String, dynamic> json) =>
    Mutation$AddFriend$addFriend$user(
      name: json['name'] as String,
      $__typename: json['__typename'] as String,
    );

Map<String, dynamic> _$Mutation$AddFriend$addFriend$userToJson(
        Mutation$AddFriend$addFriend$user instance) =>
    <String, dynamic>{
      'name': instance.name,
      '__typename': instance.$__typename,
    };
