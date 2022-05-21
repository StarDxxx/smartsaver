import 'package:flutter/material.dart';

import 'utils/theme.dart';
import 'views/home.dart';
import 'views/login.dart';
import 'views/dashboard.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Saver',
      theme: theme,
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const Home(),
        '/dashboard': (context) => const Dashboard(),
        '/login': (context) => const Login()
      },
    );
  }
}
