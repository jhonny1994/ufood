import 'package:flutter/material.dart';
import 'package:ufood/constants.dart';

class HeadText extends StatelessWidget {
  final String text;
  final String subText;
  const HeadText({
    super.key,
    required this.text,
    required this.subText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 24,
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          subText,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey.shade500,
          ),
        ),
      ],
    );
  }
}
