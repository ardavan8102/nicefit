import 'package:get/get.dart';
import 'package:nice_fit/page_handler.dart';
import 'package:nice_fit/views/main/home_screen.dart';
import 'package:nice_fit/views/registeration/login_intro.dart';
import 'package:nice_fit/views/splash.dart';

class AppRoutes {

  static const pageHandler = '/';
  static const splash = '/splash';
  static const loginIntro = '/login-intro';
  static const home = '/home-screen';

}

class AppPages {

  static final pages = [

    GetPage(
      name: AppRoutes.splash,
      page: () => SplashScreen()
    ),

    GetPage(
      name: AppRoutes.pageHandler,
      page: () => PageHandlerScreen()
    ),

    GetPage(
      name: AppRoutes.loginIntro,
      page: () => LoginIntroPage()
    ),

    GetPage(
      name: AppRoutes.home,
      page: () => HomeScreenPage()
    ),

  ];

}