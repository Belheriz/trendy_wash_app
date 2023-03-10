import 'package:graphql_flutter/graphql_flutter.dart';
import "package:gql/language.dart";
import "package:gql_error_link/gql_error_link.dart";
import "package:gql_exec/gql_exec.dart";
import "package:gql_link/gql_link.dart";
import 'package:gql/ast.dart';

class GraphQLConfig {
  final link = Link.from(
    [
      HttpLink('https://api.graphql.trendywash.net/'),
    ],
  );

  GraphQLClient clientToQuery() =>
      GraphQLClient(link: link, cache: GraphQLCache());
}
