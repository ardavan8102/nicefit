import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nice_fit/routes/getx_routes.dart';
import 'package:nice_fit/consts/app_theme.dart';
import 'package:nice_fit/controllers/page_handler_controller.dart';

void main() async {

  // Dependency Injections
  Get.put(PageHandlerController(), permanent: true);

  // Initialize Storage
  await GetStorage.init();
  
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

