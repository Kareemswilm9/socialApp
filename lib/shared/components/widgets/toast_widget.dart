  import 'package:flutter/material.dart';
  import 'package:fluttertoast/fluttertoast.dart';

  Future<bool?> showToast({required String text , required toastStates state}) => Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: choseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0
  );

  enum toastStates {SUCCESS ,ERROR,WARNING}

  Color choseToastColor(toastStates state) {
    Color color;

    switch (state) {
      case toastStates.SUCCESS:
        color = Colors.green;
        break;
      case toastStates.ERROR:
        color = Colors.red;
        break;
      case toastStates.WARNING:
        color = Colors.amber;
        break;
    }
    return color;
  }
