import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLConfig {
  static const String baseUrl = "https://app-api.rahko.ir/graphql";
 // static const String baseUrl = "https://rahko-core.hy2.ir/graphql";

  static HttpLink getHttpLink({required String path, String? token}) {
    final url = "$baseUrl$path";

    return HttpLink(
      url,
      defaultHeaders: {
        if (token != null) 'Authorization': 'Bearer $token',
      },
    );
  }

  static GraphQLClient getClient({required String path, String? token}) {
    return GraphQLClient(
      link: getHttpLink(path: path, token: token),
      cache: GraphQLCache(store: HiveStore()),
    );
  }

  static ValueNotifier<GraphQLClient> getClientNotifier({required String path, String? token}) {
    return ValueNotifier(getClient(path: path, token: token));
  }
}
