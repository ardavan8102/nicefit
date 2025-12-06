import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nice_fit/routes/getx_routes.dart';
import 'package:nice_fit/consts/strings.dart';
import 'package:nice_fit/gen/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  double _opacity = 0;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 400), (){
      setState(() {
        _opacity = 1;
      });
    });

    // Navigate to Main Screen
    Timer(
      Duration(seconds: 5),
      () {
        Get.offAndToNamed(AppRoutes.loginIntro);
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: Duration(seconds: 4),
          child: Column(
            mainAxisAlignment: .center,
            children: [
              // Image
              Image.asset(
                Assets.image.logo.path,
                scale: 2.5,
              ),

              SizedBox(height: 24),

              // Brand Name
              Text(
                AppStrings.brandName,
                style: Theme.of(context).textTheme.headlineLarge,
              ),

              SizedBox(height: 12),

              // Brand Subtext
              Text(
                AppStrings.brandSubText,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}