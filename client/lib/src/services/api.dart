// TODO: Add all GraphQL API related queries & mutations

import 'package:graphql/client.dart';
import 'package:smartsaver/src/utils/constants.dart';

class ApiService {
  static final HttpLink _httpLink = HttpLink(gqlUrl);

  static final Link _link = _httpLink;

  static final GraphQLClient client = GraphQLClient(
    link: _link,
    cache: GraphQLCache(),
  );
}
