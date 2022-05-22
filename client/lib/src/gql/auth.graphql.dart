import 'package:gql/ast.dart';
import 'package:json_annotation/json_annotation.dart';
part 'auth.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class Variables$Mutation$Login {
  Variables$Mutation$Login({required this.email, required this.password});

  @override
  factory Variables$Mutation$Login.fromJson(Map<String, dynamic> json) =>
      _$Variables$Mutation$LoginFromJson(json);

  final String email;

  final String password;

  Map<String, dynamic> toJson() => _$Variables$Mutation$LoginToJson(this);
  int get hashCode {
    final l$email = email;
    final l$password = password;
    return Object.hashAll([l$email, l$password]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Variables$Mutation$Login) ||
        runtimeType != other.runtimeType) return false;
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) return false;
    final l$password = password;
    final lOther$password = other.password;
    if (l$password != lOther$password) return false;
    return true;
  }
}

@JsonSerializable(explicitToJson: true)
class Mutation$Login {
  Mutation$Login({this.tokenAuth, required this.$__typename});

  @override
  factory Mutation$Login.fromJson(Map<String, dynamic> json) =>
      _$Mutation$LoginFromJson(json);

  final Mutation$Login$tokenAuth? tokenAuth;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Mutation$LoginToJson(this);
  int get hashCode {
    final l$tokenAuth = tokenAuth;
    final l$$__typename = $__typename;
    return Object.hashAll([l$tokenAuth, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Mutation$Login) || runtimeType != other.runtimeType)
      return false;
    final l$tokenAuth = tokenAuth;
    final lOther$tokenAuth = other.tokenAuth;
    if (l$tokenAuth != lOther$tokenAuth) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Mutation$Login on Mutation$Login {
  Mutation$Login copyWith(
          {Mutation$Login$tokenAuth? Function()? tokenAuth,
          String? $__typename}) =>
      Mutation$Login(
          tokenAuth: tokenAuth == null ? this.tokenAuth : tokenAuth(),
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

const queryDocumentLogin = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'Login'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'email')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'password')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'tokenAuth'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'email'),
                  value: VariableNode(name: NameNode(value: 'email'))),
              ArgumentNode(
                  name: NameNode(value: 'password'),
                  value: VariableNode(name: NameNode(value: 'password')))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'token'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'refreshToken'),
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
]);

@JsonSerializable(explicitToJson: true)
class Mutation$Login$tokenAuth {
  Mutation$Login$tokenAuth(
      {required this.token,
      required this.refreshToken,
      required this.$__typename});

  @override
  factory Mutation$Login$tokenAuth.fromJson(Map<String, dynamic> json) =>
      _$Mutation$Login$tokenAuthFromJson(json);

  final String token;

  final String refreshToken;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Mutation$Login$tokenAuthToJson(this);
  int get hashCode {
    final l$token = token;
    final l$refreshToken = refreshToken;
    final l$$__typename = $__typename;
    return Object.hashAll([l$token, l$refreshToken, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Mutation$Login$tokenAuth) ||
        runtimeType != other.runtimeType) return false;
    final l$token = token;
    final lOther$token = other.token;
    if (l$token != lOther$token) return false;
    final l$refreshToken = refreshToken;
    final lOther$refreshToken = other.refreshToken;
    if (l$refreshToken != lOther$refreshToken) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Mutation$Login$tokenAuth
    on Mutation$Login$tokenAuth {
  Mutation$Login$tokenAuth copyWith(
          {String? token, String? refreshToken, String? $__typename}) =>
      Mutation$Login$tokenAuth(
          token: token == null ? this.token : token,
          refreshToken: refreshToken == null ? this.refreshToken : refreshToken,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}
