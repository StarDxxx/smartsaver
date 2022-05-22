import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql/client.dart';
import 'package:smartsaver/src/services/api.dart';

final gqlClientProvider =
    Provider<GraphQLClient>((ref) => ApiService.client);
