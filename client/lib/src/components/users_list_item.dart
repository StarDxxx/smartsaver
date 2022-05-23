// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql/client.dart';
import 'package:smartsaver/src/gql/users.graphql.dart';
import 'package:smartsaver/src/providers/client.dart';
import 'package:smartsaver/src/utils/messenger.dart';
import 'package:smartsaver/src/extensions/capitalize.dart';

class UsersListItem extends StatefulWidget {
  final Query$FetchUsers$users user;
  final Query$FetchUsers$me me;
  final int image;
  const UsersListItem({
    Key? key,
    required this.user,
    required this.me,
    required this.image,
  }) : super(key: key);

  @override
  State<UsersListItem> createState() => _UsersListItemState();
}

class _UsersListItemState extends State<UsersListItem> {
  late bool isFriend;

  @override
  void initState() {
    super.initState();
    isFriend = widget.me.friends.any((friend) => friend.id == widget.user.id);
  }

  @override
  Widget build(BuildContext context) {
    final friendsCount = widget.user.mutualFriends?.length;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Card(
          margin: EdgeInsets.zero,
          clipBehavior: Clip.antiAlias,
          elevation: 4,
          shadowColor: Colors.green.shade200,
          shape: const CircleBorder(),
          child: Image.asset(
            "assets/images/${widget.image}.jpg",
            fit: BoxFit.cover,
            width: 48,
            height: 48,
          ),
        ),
        title: Text(
          widget.user.name.titleCase,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          widget.user.mutualFriends != null
              ? "You have $friendsCount mutual friend${friendsCount == 1 ? '' : 's'}"
              : "You do not have any mutual friends",
          style: const TextStyle(
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final client = ref.watch(gqlClientProvider);
            return IconButton(
              icon: Icon(
                isFriend ? Icons.check_circle_outline_rounded : Icons.add_circle,
                color: Theme.of(context).primaryColor.withOpacity(0.8),
                size: 24,
              ),
              disabledColor: Colors.grey.shade600,
              onPressed: isFriend
                  ? null
                  : () async {
                      final result = await client.mutate(
                        MutationOptions(
                          document: queryDocumentAddFriend,
                          variables: {"userId": widget.user.id},
                        ),
                      );

                      if (result.hasException) {
                        showMessenger(
                          context,
                          message: "Failed to add friend",
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
                          message:
                              "You are now friends with ${widget.user.name}",
                        );
                      }
                    },
            );
          },
        ),
      ),
    );
  }
}
