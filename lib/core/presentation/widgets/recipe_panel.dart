import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:ufood/constants.dart';

class RecipePanel extends StatelessWidget {
  final String text;
  final Widget widget;
  const RecipePanel({
    super.key,
    required this.text,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return ExpandablePanel(
      theme: const ExpandableThemeData(
        iconColor: primaryColor,
        iconSize: 30,
        headerAlignment: ExpandablePanelHeaderAlignment.center,
      ),
      header: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      collapsed: Container(),
      expanded: widget,
    );
  }
}
