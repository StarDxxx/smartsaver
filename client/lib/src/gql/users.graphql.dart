import 'package:gql/ast.dart';
import 'package:json_annotation/json_annotation.dart';
part 'users.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class Variables$Query$FetchUsers {
  Variables$Query$FetchUsers({this.name, this.email});

  @override
  factory Variables$Query$FetchUsers.fromJson(Map<String, dynamic> json) =>
      _$Variables$Query$FetchUsersFromJson(json);

  final String? name;

  final String? email;

  Map<String, dynamic> toJson() => _$Variables$Query$FetchUsersToJson(this);
  int get hashCode {
    final l$name = name;
    final l$email = email;
    return Object.hashAll([l$name, l$email]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Variables$Query$FetchUsers) ||
        runtimeType != other.runtimeType) return false;
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) return false;
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) return false;
    return true;
  }
}

@JsonSerializable(explicitToJson: true)
class Query$FetchUsers {
  Query$FetchUsers({this.users, required this.$__typename});

  @override
  factory Query$FetchUsers.fromJson(Map<String, dynamic> json) =>
      _$Query$FetchUsersFromJson(json);

  final List<Query$FetchUsers$users?>? users;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Query$FetchUsersToJson(this);
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
    if (!(other is Query$FetchUsers) || runtimeType != other.runtimeType)
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

extension UtilityExtension$Query$FetchUsers on Query$FetchUsers {
  Query$FetchUsers copyWith(
          {List<Query$FetchUsers$users?>? Function()? users,
          String? $__typename}) =>
      Query$FetchUsers(
          users: users == null ? this.users : users(),
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

const queryDocumentFetchUsers = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'FetchUsers'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'name')),
            type: NamedTypeNode(
                name: NameNode(value: 'String'), isNonNull: false),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'email')),
            type: NamedTypeNode(
                name: NameNode(value: 'String'), isNonNull: false),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'users'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'name'),
                  value: VariableNode(name: NameNode(value: 'name'))),
              ArgumentNode(
                  name: NameNode(value: 'email'),
                  value: VariableNode(name: NameNode(value: 'email')))
            ],
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

@JsonSerializable(explicitToJson: true)
class Query$FetchUsers$users {
  Query$FetchUsers$users(
      {required this.id,
      required this.name,
      required this.email,
      this.mutualFriends,
      required this.$__typename});

  @override
  factory Query$FetchUsers$users.fromJson(Map<String, dynamic> json) =>
      _$Query$FetchUsers$usersFromJson(json);

  final String id;

  final String name;

  final String email;

  final List<Query$FetchUsers$users$mutualFriends?>? mutualFriends;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Query$FetchUsers$usersToJson(this);
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
    if (!(other is Query$FetchUsers$users) || runtimeType != other.runtimeType)
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

extension UtilityExtension$Query$FetchUsers$users on Query$FetchUsers$users {
  Query$FetchUsers$users copyWith(
          {String? id,
          String? name,
          String? email,
          List<Query$FetchUsers$users$mutualFriends?>? Function()?
              mutualFriends,
          String? $__typename}) =>
      Query$FetchUsers$users(
          id: id == null ? this.id : id,
          name: name == null ? this.name : name,
          email: email == null ? this.email : email,
          mutualFriends:
              mutualFriends == null ? this.mutualFriends : mutualFriends(),
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Query$FetchUsers$users$mutualFriends {
  Query$FetchUsers$users$mutualFriends(
      {required this.name, required this.$__typename});

  @override
  factory Query$FetchUsers$users$mutualFriends.fromJson(
          Map<String, dynamic> json) =>
      _$Query$FetchUsers$users$mutualFriendsFromJson(json);

  final String name;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Query$FetchUsers$users$mutualFriendsToJson(this);
  int get hashCode {
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([l$name, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$FetchUsers$users$mutualFriends) ||
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

extension UtilityExtension$Query$FetchUsers$users$mutualFriends
    on Query$FetchUsers$users$mutualFriends {
  Query$FetchUsers$users$mutualFriends copyWith(
          {String? name, String? $__typename}) =>
      Query$FetchUsers$users$mutualFriends(
          name: name == null ? this.name : name,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Variables$Mutation$AddFriend {
  Variables$Mutation$AddFriend({required this.userId});

  @override
  factory Variables$Mutation$AddFriend.fromJson(Map<String, dynamic> json) =>
      _$Variables$Mutation$AddFriendFromJson(json);

  final String userId;

  Map<String, dynamic> toJson() => _$Variables$Mutation$AddFriendToJson(this);
  int get hashCode {
    final l$userId = userId;
    return Object.hashAll([l$userId]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Variables$Mutation$AddFriend) ||
        runtimeType != other.runtimeType) return false;
    final l$userId = userId;
    final lOther$userId = other.userId;
    if (l$userId != lOther$userId) return false;
    return true;
  }
}

@JsonSerializable(explicitToJson: true)
class Mutation$AddFriend {
  Mutation$AddFriend({this.addFriend, required this.$__typename});

  @override
  factory Mutation$AddFriend.fromJson(Map<String, dynamic> json) =>
      _$Mutation$AddFriendFromJson(json);

  final Mutation$AddFriend$addFriend? addFriend;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Mutation$AddFriendToJson(this);
  int get hashCode {
    final l$addFriend = addFriend;
    final l$$__typename = $__typename;
    return Object.hashAll([l$addFriend, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Mutation$AddFriend) || runtimeType != other.runtimeType)
      return false;
    final l$addFriend = addFriend;
    final lOther$addFriend = other.addFriend;
    if (l$addFriend != lOther$addFriend) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Mutation$AddFriend on Mutation$AddFriend {
  Mutation$AddFriend copyWith(
          {Mutation$AddFriend$addFriend? Function()? addFriend,
          String? $__typename}) =>
      Mutation$AddFriend(
          addFriend: addFriend == null ? this.addFriend : addFriend(),
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

const queryDocumentAddFriend = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'AddFriend'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'userId')),
            type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'addFriend'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'userId'),
                  value: VariableNode(name: NameNode(value: 'userId')))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'user'),
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

@JsonSerializable(explicitToJson: true)
class Mutation$AddFriend$addFriend {
  Mutation$AddFriend$addFriend({this.user, required this.$__typename});

  @override
  factory Mutation$AddFriend$addFriend.fromJson(Map<String, dynamic> json) =>
      _$Mutation$AddFriend$addFriendFromJson(json);

  final Mutation$AddFriend$addFriend$user? user;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Mutation$AddFriend$addFriendToJson(this);
  int get hashCode {
    final l$user = user;
    final l$$__typename = $__typename;
    return Object.hashAll([l$user, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Mutation$AddFriend$addFriend) ||
        runtimeType != other.runtimeType) return false;
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Mutation$AddFriend$addFriend
    on Mutation$AddFriend$addFriend {
  Mutation$AddFriend$addFriend copyWith(
          {Mutation$AddFriend$addFriend$user? Function()? user,
          String? $__typename}) =>
      Mutation$AddFriend$addFriend(
          user: user == null ? this.user : user(),
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

@JsonSerializable(explicitToJson: true)
class Mutation$AddFriend$addFriend$user {
  Mutation$AddFriend$addFriend$user(
      {required this.name, required this.$__typename});

  @override
  factory Mutation$AddFriend$addFriend$user.fromJson(
          Map<String, dynamic> json) =>
      _$Mutation$AddFriend$addFriend$userFromJson(json);

  final String name;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Mutation$AddFriend$addFriend$userToJson(this);
  int get hashCode {
    final l$name = name;
    final l$$__typename = $__typename;
    return Object.hashAll([l$name, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Mutation$AddFriend$addFriend$user) ||
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

extension UtilityExtension$Mutation$AddFriend$addFriend$user
    on Mutation$AddFriend$addFriend$user {
  Mutation$AddFriend$addFriend$user copyWith(
          {String? name, String? $__typename}) =>
      Mutation$AddFriend$addFriend$user(
          name: name == null ? this.name : name,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}
