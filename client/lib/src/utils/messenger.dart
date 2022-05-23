import 'package:flutter/material.dart';

enum MessageType { error, success }

void showMessenger(
  BuildContext context, {
  required String message,
  MessageType type = MessageType.success,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: type == MessageType.success ? Colors.green : Colors.red,
      content: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(message),
      ),
    ),
  );
}
