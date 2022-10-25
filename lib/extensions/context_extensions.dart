import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  void showSnackBar({
    required String text,
    IconData? icon,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16.0),
          ),
        ),
        content: Row(
          children: [
            if (icon != null)
              Icon(
                icon,
                color: Colors.red,
                size: 24.0,
              ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 19,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
