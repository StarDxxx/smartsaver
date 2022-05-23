import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql/client.dart';
import 'package:smartsaver/src/gql/users.graphql.dart';
import 'package:smartsaver/src/models/dashboard.dart';
import 'package:smartsaver/src/providers/client.dart';

final usersProvider = FutureProvider.family.autoDispose<DashboardData, Variables$Query$FetchUsers?>(
  (ref, args) async {
    final client = ref.read(gqlClientProvider);
    final results = await client.query(
      QueryOptions(
        document: queryDocumentFetchUsers,
        variables: {
          "email": args?.email,
          "name": args?.email,
        },
      ),
    );

    if (results.hasException) {
      throw results.exception?.graphqlErrors.first.message ??
          "Unknown Error";
    }

    final data = Query$FetchUsers.fromJson(results.data!);

    return DashboardData(users: data.users, me: data.me);
  },
);
