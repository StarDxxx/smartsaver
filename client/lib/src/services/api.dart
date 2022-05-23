import 'package:graphql/client.dart';
import 'package:smartsaver/src/utils/constants.dart';

abstract class ApiService {
  static final Link _link = HttpLink(gqlUrl);
  static final GraphQLClient client = GraphQLClient(
    link: _link,
    cache: GraphQLCache(),
  );
}
