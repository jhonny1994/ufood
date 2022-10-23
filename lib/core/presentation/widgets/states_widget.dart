import 'package:flutter/material.dart';
import 'package:ufood/constants.dart';

class StatesWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  const StatesWidget({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Icon(
            icon,
            color: secondaryColor,
            size: 10,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          text,
          style: Theme.of(context).textTheme.caption,
        ),
      ],
    );
  }
}
