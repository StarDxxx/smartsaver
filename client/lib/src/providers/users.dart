import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql/client.dart';
import 'package:smartsaver/src/gql/users.graphql.dart';
import 'package:smartsaver/src/providers/client.dart';

final usersProvider = FutureProvider<List<Query$FetchUsers$users?>?>(
  (ref) async {
    final client = ref.watch(gqlClientProvider);
    final results = await client.query(
      QueryOptions(document: queryDocumentFetchUsers),
    );

    final data = Query$FetchUsers.fromJson(results.data!);

    return data.users;
  },
);
