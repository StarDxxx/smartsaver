import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql/client.dart';
import 'package:smartsaver/src/gql/auth.graphql.dart';
import 'package:smartsaver/src/providers/client.dart';

final authTokenProvider = FutureProvider.autoDispose
    .family<Mutation$Login$tokenAuth?, Variables$Mutation$Login>(
  (ref, credentials) async {
    final client = ref.watch(gqlClientProvider);
    final notifier = ref.watch(gqlClientProvider.notifier);
    final result = await client.mutate(
      MutationOptions(
        document: queryDocumentLogin,
        variables: {
          "email": credentials.email,
          "password": credentials.password,
        },
      ),
    );

    if (result.hasException) {
      throw Exception(result.exception);
    }

    final data = Mutation$Login.fromJson(result.data!);
    // Set JWT Token
    notifier.addAuthToken(data.tokenAuth!.token);

    return data.tokenAuth;
  },
);