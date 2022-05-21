import 'package:flutter/material.dart';

class UsersListItem extends StatelessWidget {
  const UsersListItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Doug'),
      subtitle: const Text('doug@demo.com'),
      trailing: IconButton(
        onPressed: () {
          // TODO: Connect add friends logic
        },
        icon: const Icon(Icons.person_add),
      ),
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Horray'),
          ),
        );
      },
      hoverColor: Theme.of(context).primaryColor.withOpacity(0.2),
    );
  }
}
