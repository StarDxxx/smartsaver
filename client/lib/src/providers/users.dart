import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql/client.dart';
import 'package:smartsaver/src/gql/users.graphql.dart';
import 'package:smartsaver/src/providers/client.dart';

final usersProvider = FutureProvider<List<Query$Users$users?>?>(
  (ref) async {
    final client = ref.read(gqlClientProvider);
    final results =
        await client.query(QueryOptions(document: queryDocumentUsers));

    final data = Query$Users.fromJson(results.data!);

    return data.users;
  },
);
