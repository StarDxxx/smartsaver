// TODO: Add all GraphQL API related queries & mutations

import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:smartsaver/src/utils/constants.dart';

abstract class ApiService {
  static final HttpLink _httpLink = HttpLink(gqlUrl);

  static final Link _link = _httpLink;

  static final ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: _link,
      cache: GraphQLCache(store: HiveStore()),
    ),
  );

  // Login
  // Fetch User
  // Fetch/Search All Users
}
