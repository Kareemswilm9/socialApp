import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white, size: 35),
      titleTextStyle: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
      titleSpacing: 16,
      backgroundColor: Colors.black,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.light)),
  iconTheme: const IconThemeData(color: Colors.white, size: 35),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey[500],
      type: BottomNavigationBarType.fixed),
  primarySwatch: Colors.blue,
  textTheme: const TextTheme(
    bodyText2: TextStyle(color: Colors.white),
    bodyText1: TextStyle(color: Colors.white),
  ),
  fontFamily: 'Cairo',
);
ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.black, size: 35),
      titleTextStyle: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
      titleSpacing: 16,
      backgroundColor: Colors.white,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark)),
  iconTheme: const IconThemeData(color: Colors.black, size: 35),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey[500],
      type: BottomNavigationBarType.fixed),
  primarySwatch: Colors.blue,
  fontFamily: 'Cairo',
);
