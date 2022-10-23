import 'package:flutter/material.dart';

class AppName extends StatelessWidget {
  final String text;
  final Color color;
  const AppName({
    super.key,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 32,
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
