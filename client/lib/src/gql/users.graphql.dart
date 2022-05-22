import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'package:json_annotation/json_annotation.dart';
part 'users.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class Query$Users {
  Query$Users({this.users, required this.$__typename});

  @override
  factory Query$Users.fromJson(Map<String, dynamic> json) =>
      _$Query$UsersFromJson(json);

  final List<Query$Users$users?>? users;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Query$UsersToJson(this);
  int get hashCode {
    final l$users = users;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$users == null ? null : Object.hashAll(l$users.map((v) => v)),
      l$$__typename
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$Users) || runtimeType != other.runtimeType)
      return false;
    final l$users = users;
    final lOther$users = other.users;
    if (l$users != null && lOther$users != null) {
      if (l$users.length != lOther$users.length) return false;
      for (int i = 0; i < l$users.length; i++) {
        final l$users$entry = l$users[i];
        final lOther$users$entry = lOther$users[i];
        if (l$users$entry != lOther$users$entry) return false;
      }
    } else if (l$users != lOther$users) {
      return false;
    }

    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$Users on Query$Users {
  Query$Users copyWith(
          {List<Query$Users$users?>? Function()? users, String? $__typename}) =>
      Query$Users(
          users: users == null ? this.users : users(),
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

const queryDocumentUsers = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'Users'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'users'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'name'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'email'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'mutualFriends'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'name'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ])),
              FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ])),
        FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ])),
]);
Query$Users _parserFn$Query$Users(Map<String, dynamic> data) =>
    Query$Users.fromJson(data);

class Options$Query$Users extends graphql.QueryOptions<Query$Users> {
  Options$Query$Users(
      {String? operationName,
      graphql.FetchPolicy? fetchPolicy,
      graphql.ErrorPolicy? errorPolicy,
      graphql.CacheRereadPolicy? cacheRereadPolicy,
      Object? optimisticResult,
      Duration? pollInterval,
      graphql.Context? context})
      : super(
            operationName: operationName,
            fetchPolicy: fetchPolicy,
            errorPolicy: errorPolicy,
            cacheRereadPolicy: cacheRereadPolicy,
            optimisticResult: optimisticResult,
            pollInterval: pollInterval,
            context: context,
            document: queryDocumentUsers,
            parserFn: _parserFn$Query$Users);
}

class WatchOptions$Query$Users extends graphql.WatchQueryOptions<Query$Users> {
  WatchOptions$Query$Users(
      {String? operationName,
      graphql.FetchPolicy? fetchPolicy,
      graphql.ErrorPolicy? errorPolicy,
      graphql.CacheRereadPolicy? cacheRereadPolicy,
      Object? optimisticResult,
      graphql.Context? context,
      Duration? pollInterval,
      bool? eagerlyFetchResults,
      bool carryForwardDataOnException = true,
      bool fetchResults = false})
      : super(
            operationName: operationName,
            fetchPolicy: fetchPolicy,
            errorPolicy: errorPolicy,
            cacheRereadPolicy: cacheRereadPolicy,
            optimisticResult: optimisticResult,
            context: context,
            document: queryDocumentUsers,
            pollInterval: pollInterval,
            eagerlyFetchResults: eagerlyFetchResults,
            carryForwardDataOnException: carryForwardDataOnException,
            fetchResults: fetchResults,
            parserFn: _parserFn$Query$Users);
}

class FetchMoreOptions$Query$Users extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$Users({required graphql.UpdateQuery updateQuery})
      : super(updateQuery: updateQuery, document: queryDocumentUsers);
}

extension ClientExtension$Query$Users on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$Users>> query$Users(
          [Options$Query$Users? options]) async =>
      await this.query(options ?? Options$Query$Users());
  graphql.ObservableQuery<Query$Users> watchQuery$Users(
          [WatchOptions$Query$Users? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$Users());
  void writeQuery$Users({required Query$Users data, bool broadcast = true}) =>
      this.writeQuery(
          graphql.Request(
              operation: graphql.Operation(document: queryDocumentUsers)),
          data: data.toJson(),
          broadcast: broadcast);
  Query$Users? readQuery$Users({bool optimistic = true}) {
    final result = this.readQuery(
        graphql.Request(
            operation: graphql.Operation(document: queryDocumentUsers)),
        optimistic: optimistic);
    return result == null ? null : Query$Users.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$Users> useQuery$Users(
        [Options$Query$Users? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$Users());
graphql.ObservableQuery<Query$Users> useWatchQuery$Users(
        [WatchOptions$Query$Users? options]) =>
    graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$Users());

class Query$Users$Widget extends graphql_flutter.Query<Query$Users> {
  Query$Users$Widget(
      {widgets.Key? key,
      Options$Query$Users? options,
      required graphql_flutter.QueryBuilder<Query$Users> builder})
      : super(
            key: key,
            options: options ?? Options$Query$Users(),
            builder: builder);
}

@JsonSerializable(explicitToJson: true)
class Query$Users$users {
  Query$Users$users(
      {required this.id,
      required this.name,
      required this.email,
      this.mutualFriends,
      required this.$__typename});

  @override
  factory Query$Users$users.fromJson(Map<String, dynamic> json) =>
      _$Query$Users$usersFromJson(json);

  final String id;

  final String name;

  final String email;

  final List<Query$Users$users$mutualFriends?>? mutualFriends;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Query$Users$usersToJson(this);
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$email = email;
    final l$mutualFriends = mutualFriends;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$email,
      l$mutualFriends == null
          ? null
          : Object.hashAll(l$mutualFriends.map((v) => v)),
      l$$__typename
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$Users$users) || runtimeType != other.runtimeType)
      return false;
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) return false;
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) return false;
    final l$mutualFriends = mutualFriends;
    final lOther$mutualFriends = other.mutualFriends;
    if (l$mutualFriends != null && lOther$mutualFriends != null) {
      if (l$mutualFriends.length != lOther$mutualFriends.length) return false;
      for (int i = 0; i < l$mutualFriends.length; i++) {
        final l$mutualFriends$entry = l$mutualFriends[i];
        final lOther$mutualFriends$entry = lOther$mutualFriends[i];
        if (l$mutualFriends$entry != lOther$mutualFriends$entry) return false;
      }
    } else if (l$mutualFriends != lOther$mutualFriends) {
      return false;
    }

    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$Users$users on Query$Users$users {
  Query$Users$users copyWith(
          {String? id,
          String? name,
          String? email,
          List<Query$Users$users$mutualFriends?>? Function()? mutualFriends,
          String? $__typename}) =>
      Query$Users$users(
          id: id == null ? this.id : id,
          name: name == null ? this.name : name,
          email: email == null ? this.email : email,
          mutualFriends:
              mutualFriends == null ? this.mutualFriends : mutualFriends(),
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Query$Users$users$mutualFriends {
  Query$Users$users$mutualFriends(
      {required this.name, required this.$__typename});

  @override
  factory Query$Users$users$mutualFriends.fromJson(Map<String, dynamic> json) =>
      _$Query$Users$users$mutualFriendsFromJson(json);

  final String name;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Query$Users$users$mutualFriendsToJson(this);
  int get hashCode {
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([l$name, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$Users$users$mutualFriends) ||
        runtimeType != other.runtimeType) return false;
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$Users$users$mutualFriends
    on Query$Users$users$mutualFriends {
  Query$Users$users$mutualFriends copyWith(
          {String? name, String? $__typename}) =>
      Query$Users$users$mutualFriends(
          name: name == null ? this.name : name,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}
