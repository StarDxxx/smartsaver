import 'package:flutter/material.dart';
import 'package:smartsaver/src/gql/users.graphql.dart';

class UsersListItem extends StatelessWidget {
  final Query$FetchUsers$users user;
  const UsersListItem({
    Key? key,
    required this.user,
  }) : super(key: key);

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
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: IconButton(
        onPressed: () {
          // TODO: Connect add friends logic
        },
        icon: const Icon(Icons.person_add),
      ),
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('You are now friends with ${user.name}'),
            ),
            backgroundColor: Theme.of(context).primaryColor,
            behavior: SnackBarBehavior.floating,
          ),
        );
      },
      hoverColor: Theme.of(context).primaryColor.withOpacity(0.2),
    );
  }
}
