import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:smartsaver/src/components/users_list_item.dart';
import 'package:smartsaver/src/gql/users.graphql.dart';

class UsersList extends StatelessWidget {
  const UsersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Query$Users$Widget(
      builder: (
        QueryResult result, {
        VoidCallback? refetch,
        FetchMore? fetchMore,
      }) {
        // Loading State
        if (result.isLoading) {
          return const Center(
            child: SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        }
        // Error State
        if (result.hasException) {
          debugPrint(
            result.exception?.linkException?.originalException.toString(),
          );
          return const Center(
            child: Text('Something went wrong'),
          );
        }
        // Possible Data

        final data = result.parsedData as Query$Users;

        if (data.users == null) {
          return const Text('No users found');
        }

        final users = data.users!;

        return ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index]!;
            return UsersListItem(
              user: user,
            );
          },
        );
      },
    );
  }
}
