import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartsaver/src/components/users_list.dart';
import 'package:smartsaver/src/providers/auth.dart';

import '../providers/users.dart';

class Dashboard extends ConsumerWidget {
  static const routeName = '/dashboard';
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(usersProvider(null));
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              iconTheme: Theme.of(context).iconTheme,
              pinned: true,
              title: Text(
                'Dashboard',
                style: Theme.of(context).textTheme.headline4?.copyWith(
                      color: Colors.grey.shade900,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              centerTitle: false,
              actions: [
                IconButton(
                  tooltip: 'Logout',
                  onPressed: ref.read(authStateProvider.notifier).logout,
                  icon: const Icon(
                    Icons.logout,
                    semanticLabel: 'Logout',
                  ),
                ),
              ],
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              sliver: SliverFillRemaining(
                child: provider.when(
                  data: (data) => UsersList(data),
                  error: (err, st) {
                    final message =
                        err.toString().contains("You do not have permission")
                            ? 'Ooops, you are not supposed to be here.'
                            : err.toString();
                    return Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Center(
                          child: Text(
                            message,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          ),
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
