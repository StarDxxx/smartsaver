import 'package:flutter/material.dart';
import 'utils/theme.dart';
import 'views/home.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Saver',
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}
