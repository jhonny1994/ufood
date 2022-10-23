import 'package:flutter/material.dart';
import 'package:ufood/constants.dart';
import 'package:ufood/core/presentation/widgets/app_name.dart';

AppBar topBar({void Function()? onButtonTapped, IconData? icon}) {
  return AppBar(
    title: const AppName(text: 'Ufood', color: primaryColor),
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.transparent,
    iconTheme: const IconThemeData(color: textColor),
    actions: [
      if (onButtonTapped != null)
        GestureDetector(
          onTap: onButtonTapped,
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              radius: 15,
              backgroundColor: primaryColor,
              child: Icon(
                icon,
                color: secondaryColor,
              ),
            ),
          ),
        )
      else
        Container(),
    ],
  );
}
