import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0.0,
      titleTextStyle: TextStyle(
          color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.black, statusBarBrightness: Brightness.light),
      actionsIconTheme: IconThemeData(color: Colors.black),
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: Colors.black, fontSize: 18),
    ),
    iconTheme: IconThemeData(color: Colors.grey),
    scaffoldBackgroundColor: Colors.white,
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(backgroundColor: Colors.white));
ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xff1a237e),
    iconTheme: IconThemeData(color: Colors.grey),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff000051),
      elevation: 0.0,
      titleTextStyle: TextStyle(
          color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      actionsIconTheme: IconThemeData(color: Colors.white),
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white, statusBarBrightness: Brightness.dark),
    ),
    textTheme: const TextTheme(
        bodyText1: TextStyle(color: Colors.white, fontSize: 18)),
    bottomNavigationBarTheme:
        BottomNavigationBarThemeData(backgroundColor: Color(0xff534bae),
        selectedItemColor: Colors.white,
          unselectedItemColor: Color(0xff000051),
        ),


);

String? token;
