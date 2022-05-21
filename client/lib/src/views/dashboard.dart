import 'package:flutter/material.dart';

import '../components/users_list_item.dart';

class Dashboard extends StatelessWidget {
  static const routeName = '/dashboard';
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
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
            SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: maxWidth >= 769 ? maxWidth * 0.2 : maxWidth * 0.02,
              ),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const UsersListItem(),
                    const UsersListItem(),
                    const UsersListItem(),
                    const UsersListItem(),
                    const UsersListItem(),
                    const UsersListItem(),
                    const UsersListItem(),
                    const UsersListItem(),
                    const UsersListItem(),
                    const UsersListItem(),
                    const UsersListItem(),
                    const UsersListItem(),
                    const UsersListItem(),
                    const UsersListItem(),
                    const UsersListItem(),
                    const UsersListItem(),
                    const UsersListItem(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
