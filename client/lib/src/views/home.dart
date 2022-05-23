import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartsaver/src/providers/auth.dart';

import 'dashboard.dart';
import 'login.dart';

class Home extends ConsumerWidget {
  static const routeName = '/';
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    switch (authState) {
      case AuthState.authenticated:
        return const Dashboard();
      default:
        return const Login();
    }
  }
}
