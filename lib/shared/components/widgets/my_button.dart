import 'package:flutter/material.dart';

import '../constants.dart';

Widget myButton({
  double width = double.infinity,
  Color background = secondaryColor,
  bool isBackgroundGold = true,
  required void Function() onTap,
  required String text,
  double radius = 10.0,
  bool isUpperCase = true,
}) =>
    Container(
      width: width,
      height: 40.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
      child: MaterialButton(
        onPressed: onTap,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: isBackgroundGold ? primaryColor : secondaryColor,
          ),
        ),
      ),
    );



