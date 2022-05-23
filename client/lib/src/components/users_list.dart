import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartsaver/src/components/users_list_item.dart';
import 'package:smartsaver/src/providers/users.dart';
import 'package:smartsaver/src/views/home.dart';

class UsersList extends ConsumerWidget {
  const UsersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(usersProvider(null));
    return provider.when(
      data: (data) {
        if (data.users == null) {
          return const Center(child: Text('No Registered Users'));
        }
        return ListView.builder(
          itemBuilder: (context, index) {
            final user = data.users![index]!;
            return UsersListItem(
              user: user,
              me: data.me!,
            );
          },
          itemCount: data.users!.length,
        );
      },
      error: (err, st) {
        final message = err.toString().contains("You do not have permission")
            ? 'Ooops, you are not supposed to be here.'
            : err.toString();
        return Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    message,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      Home.routeName,
                      (route) => false,
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'HOME',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
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
