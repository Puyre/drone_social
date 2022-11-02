import 'package:flutter/material.dart';

class BeerTextField extends StatelessWidget {
  final String hint;
  final bool obscureText;
  final Function(String text) onChanged;

  const BeerTextField({
    super.key,
    required this.hint,
    required this.onChanged,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      cursorColor: Colors.amber,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.amber,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.white.withOpacity(0.8),
        ),

      ),
      onChanged: onChanged,
    );
  }
}
