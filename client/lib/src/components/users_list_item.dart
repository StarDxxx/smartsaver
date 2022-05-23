// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql/client.dart';
import 'package:smartsaver/src/gql/users.graphql.dart';
import 'package:smartsaver/src/providers/client.dart';
import 'package:smartsaver/src/utils/messenger.dart';

class UsersListItem extends StatefulWidget {
  final Query$FetchUsers$users user;
  final Query$FetchUsers$me me;
  const UsersListItem({
    Key? key,
    required this.user,
    required this.me,
  }) : super(key: key);

  @override
  State<UsersListItem> createState() => _UsersListItemState();
}

class _UsersListItemState extends State<UsersListItem> {
  late bool isFriend;

  @override
  void initState() {
    isFriend = widget.me.friends.any((friend) => friend.id == widget.user.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).primaryColor.withOpacity(0.8),
        ),
        padding: const EdgeInsets.all(8),
        child: Icon(
          Icons.person_outline_rounded,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
      title: Text(widget.user.name),
      subtitle: Text(widget.user.mutualFriends != null
          ? "${widget.user.mutualFriends!.length} Mutual Friend${widget.user.mutualFriends!.length == 1 ? '' : 's'}"
          : "No mutual friends"),
      trailing: isFriend
          ? null
          : Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                final client = ref.watch(gqlClientProvider);
                return IconButton(
                  onPressed: () async {
                    final result = await client.mutate(
                      MutationOptions(
                        document: queryDocumentAddFriend,
                        variables: {"userId": widget.user.id},
                      ),
                    );

                    if (result.hasException) {
                      showMessenger(
                        context,
                        message: "Cannot add friend",
                        type: MessageType.error,
                      );
                    }

                    if (result.data != null) {
                      // Optimisic UI update
                      setState(() {
                        isFriend = true;
                      });
                      showMessenger(
                        context,
                        message: "You are now friends with ${widget.user.name}",
                      );
                    }
                  },
                  icon: const Icon(Icons.person_add),
                );
              },
            ),
    );
  }
}
