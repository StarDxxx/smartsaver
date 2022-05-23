import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartsaver/src/components/users_list_item.dart';
import 'package:smartsaver/src/models/dashboard.dart';

class UsersList extends ConsumerWidget {
  const UsersList(this.data, {Key? key}) : super(key: key);
  final DashboardData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final user = data.users![index]!;
        return UsersListItem(
          user: user,
          me: data.me!,
          image: Random().nextInt(5) + 1,
        );
      },
      itemCount: data.users!.length,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 12,
        );
      },
    );
  }
}
