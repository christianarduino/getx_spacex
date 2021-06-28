import 'package:graphql/client.dart';

GraphQLClient provideGraphql(String host) {
  final HttpLink _link = HttpLink(host);
  final GraphQLClient _client = GraphQLClient(
    cache: GraphQLCache(),
    link: _link,
  );

  return _client;
}
