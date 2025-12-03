import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nice_fit/consts/app_routes.dart';
import 'package:nice_fit/consts/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      
      title: 'Nice Fit',

      locale: Locale('fa', 'IR'),

      theme: AppTheme.mainTheme,

      initialRoute: AppRoutes.splash,
      getPages: AppPages.pages,
    );
  }
}