import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:smartsaver/src/services/api.dart';

import 'utils/theme.dart';
import 'views/home.dart';
import 'views/login.dart';
import 'views/dashboard.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: ApiService.client,
      child: MaterialApp(
        title: 'Smart Saver',
        theme: theme,
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const Home(),
          '/dashboard': (context) => const Dashboard(),
          '/login': (context) => const Login()
        },
      ),
    );
  }
}
