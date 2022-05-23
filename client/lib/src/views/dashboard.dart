import 'package:flutter/material.dart';
import 'package:smartsaver/src/components/users_list.dart';
import 'package:smartsaver/src/views/login.dart';


class Dashboard extends StatelessWidget {
  static const routeName = '/dashboard';
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              title: const Text('Dashboard'),
              centerTitle: true,              
              actions: [
                IconButton(
                  tooltip: 'Logout',
                  onPressed: () {
                    // TODO Implement server logout
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
