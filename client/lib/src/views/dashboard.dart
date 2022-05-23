import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartsaver/src/components/users_list.dart';
import 'package:smartsaver/src/views/login.dart';


class Dashboard extends ConsumerWidget {
  static const routeName = '/dashboard';
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              title: const Text('Dashboard'),
              centerTitle: true,
              actions: [
                IconButton(
                  tooltip: 'Logout',
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      Login.routeName,
                      (route) => false,
                    );
                  },
                  icon: const Icon(
                    Icons.logout,
                    semanticLabel: 'Logout',
                  ),
                ),
              ],
            ),
            const SliverFillRemaining(
              child: UsersList(),
            )
          ],
        ),
      ),
    );
  }
}
