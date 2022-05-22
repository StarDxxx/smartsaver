import 'package:flutter/material.dart';
import 'package:smartsaver/src/components/users_list.dart';


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
                    // TODO logout user
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      "/login",
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
