import 'package:flutter/material.dart';

class AppTheme {

  static ThemeData mainTheme = ThemeData(

    // Global Configs
    fontFamily: 'Dana',

    // Texts
    textTheme: TextTheme(
      
      // HeadLines
      headlineLarge: TextStyle(
        fontSize: 50,
        fontFamily: 'Rokh',
        fontWeight: FontWeight.w900,
      ),

      
      // Titles
      titleSmall: TextStyle(
        fontFamily: 'Dana',
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),

    ),

  );

}