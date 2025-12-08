// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:nice_fit/views/main/exercise_screen.dart';
import 'package:nice_fit/views/main/home_screen.dart';
import 'package:nice_fit/views/main/profile.dart';

class AppBottomNavBarPages {

  static final List<Widget> pages = [

    HomeScreenPage(),

    Center(child: Text('Page 2')), // Acitivities

    ExerciseScreen(), // Exercises

    ProfileScreen(), // Profile

  ];

}