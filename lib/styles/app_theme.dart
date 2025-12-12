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

      titleMedium: TextStyle(
        fontFamily: 'Dana',
        fontSize: 24,
        fontWeight: FontWeight.w800,
      ),

      titleLarge: TextStyle(
        fontFamily: 'Dana',
        fontSize: 30,
        fontWeight: FontWeight.w900,
      ),


      // Body
      bodySmall: TextStyle(
        fontFamily: 'Dana',
        fontSize: 14,
        fontWeight: FontWeight.w300,
      ),

      bodyMedium: TextStyle(
        fontFamily: 'Dana',
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      
      bodyLarge: TextStyle(
        fontFamily: 'Dana',
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),

      // Labels
      labelSmall: TextStyle(
        fontFamily: 'Dana',
        fontSize: 12,
        fontWeight: FontWeight.w300,
      ),

      labelMedium: TextStyle(
        fontFamily: 'Dana',
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      
      labelLarge: TextStyle(
        fontFamily: 'Dana',
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),

    ),

  );

}