import 'package:smartsaver/src/gql/users.graphql.dart';

class DashboardData {
  final List<Query$FetchUsers$users?>? users;
  final Query$FetchUsers$me? me;

  DashboardData({this.users, this.me});
}
