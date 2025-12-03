import 'package:get/get.dart';
import 'package:nice_fit/views/registeration/login_intro.dart';
import 'package:nice_fit/views/splash.dart';

class AppRoutes {

  static const splash = '/';
  static const loginIntro = '/login-intro';

}

class AppPages {

  static final pages = [

    GetPage(
      name: AppRoutes.splash,
      page: () => SplashScreen()
    ),

    GetPage(
      name: AppRoutes.loginIntro,
      page: () => LoginIntroPage()
    ),

  ];

}