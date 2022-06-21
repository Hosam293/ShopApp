import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme=ThemeData(
    appBarTheme: const AppBarTheme(

      backgroundColor: Colors.white,
      elevation: 0.0,
      titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold),
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarBrightness: Brightness.light),
      actionsIconTheme: IconThemeData(color: Colors.black),
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: Colors.black, fontSize: 18),),
    iconTheme: IconThemeData(color: Colors.grey),
    scaffoldBackgroundColor: Colors.white,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white));
ThemeData darkTheme=ThemeData(
    primarySwatch: Colors.deepOrange,
    scaffoldBackgroundColor:  Colors.grey,
    iconTheme: IconThemeData(color: Colors.grey),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.grey,
      elevation: 0.0,
      titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold),
      actionsIconTheme: IconThemeData(color: Colors.white),
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.dark),
    ),
    textTheme: const TextTheme(
        bodyText1: TextStyle(color: Colors.white, fontSize: 18)),
    bottomNavigationBarTheme:
    BottomNavigationBarThemeData(backgroundColor: Colors.grey));

String? token;