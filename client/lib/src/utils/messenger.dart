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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: type == MessageType.success ? Colors.green : Colors.red,
      content: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            Icon(
              type == MessageType.success
                  ? Icons.check_circle_rounded
                  : Icons.error_outline_rounded,
              color: Colors.white,
            ),
            const SizedBox(width: 24),
            Text(message),
          ],
        ),
      ),
    ),
  );
}
