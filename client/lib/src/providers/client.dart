import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql/client.dart';
import 'package:smartsaver/src/services/api.dart';
import 'package:smartsaver/src/utils/constants.dart';

final gqlClientProvider = StateNotifierProvider<GQLClient, GraphQLClient>(
  (ref) => GQLClient(ref),
);

class GQLClient extends StateNotifier<GraphQLClient> {
  GQLClient(this.ref) : super(ApiService.client);

  final Ref ref;

  void addAuthToken(String token) {
    final Link link = HttpLink(gqlUrl);
    final authLink = AuthLink(getToken: () => "JWT $token");
    state = state.copyWith(link: authLink.concat(link));
  }
}
