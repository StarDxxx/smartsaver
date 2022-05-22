import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartsaver/src/components/users_list_item.dart';
import 'package:smartsaver/src/providers/users.dart';

class UsersList extends ConsumerWidget {
  const UsersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(usersProvider);
    return provider.when(
      data: (data) {
        if (data == null) {
          return const Text('No data');
        }
        return ListView.builder(
          itemBuilder: (context, index) {
            final user = data[index]!;
            return UsersListItem(user: user);
          },
          itemCount: data.length,
        );
      },
      error: (err, st) {
        return const Text('Oh No! something went wrong');
      },
      loading: () => const Center(
        child: SizedBox(
          height: 24,
          width: 24,
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }
}
