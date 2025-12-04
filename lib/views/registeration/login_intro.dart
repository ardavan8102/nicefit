import 'dart:math';
import 'package:flutter/material.dart';
import 'package:frino_icons/frino_icons.dart';
import 'package:get/get.dart';
import 'package:nice_fit/components/buttons/full_width_social_button.dart';
import 'package:nice_fit/consts/app_routes.dart';
import 'package:nice_fit/consts/colors.dart';
import 'package:nice_fit/consts/strings.dart';
import 'package:nice_fit/gen/assets.gen.dart';

class LoginIntroPage extends StatelessWidget {
  const LoginIntroPage({super.key});

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppSolidColors.scaffoldBG,
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            mainAxisAlignment: .center,
            children: [
              // Image
              SizedBox(
                width: size.width,
                height: size.height * 0.4,
                child: Stack(
                  alignment: .center,
                  children: [
                    // Rotated Background rectangle
                    Positioned(
                      left: 0,
                      right: 0,
                      top: size.height * .1,
                      child: Transform.rotate(
                        angle: -pi / 12,
                        child: Container(
                          width: size.width,
                          height: size.height * .2,
                          color: AppSolidColors.primary,
                        ),
                      ),
                    ),

                    // Image
                    ShaderMask(
                      shaderCallback: (Rect bounds){
                        return const LinearGradient(
                          begin: .bottomCenter,
                          end: .topCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black
                          ],
                          stops: [0.25, 0.5]
                        ).createShader(bounds);
                      },
                      blendMode: .dstIn,
                      child: Container(
                        width: size.width * .75,
                        height: size.height * .5,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              Assets.image.bodyBuilderMan.path,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),

                    // Make orange rectangle border's Cut
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            color: Colors.white,
                            width: size.width / 12,
                          ),
                          right: BorderSide(
                            color: Colors.white,
                            width: size.width / 12,
                          ),
                        )
                      ),
                    ),
                  ],
                ),
              ),

              // Title & Texts
              Column(
                children: [
                  Text(
                    'خوش آمدید به',
                    style: textTheme.titleMedium,
                  ),

                  const SizedBox(height: 14),

                  Text(
                    'اپلیکیشن ${AppStrings.brandName}',
                    style: textTheme.headlineLarge!.copyWith(
                      fontSize: 32
                    ),
                  ),

                  const SizedBox(height: 16),

                  Text(
                    'برنامه ریزی و تنظیم تمرینات روزانه',
                    style: textTheme.bodyMedium,
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Buttons
              Column(
                spacing: 24,
                children: [
                  FullWidthSocialButton(
                    size: size,
                    backGroundColor: Colors.white,
                    borderColor: Colors.grey.shade300,
                    radius: .circular(12),
                    icon: FrinoIcons.f_google,
                    foregroundColor: AppSolidColors.primary,
                    buttonText: 'ورود با گوگل',
                    iconSize: 24,
                  ),

                  FullWidthSocialButton(
                    size: size,
                    backGroundColor: Colors.black,
                    borderColor: Colors.black,
                    radius: .circular(12),
                    icon: Icons.apple,
                    foregroundColor: Colors.white,
                    buttonText: 'ورود با اپــل',
                    iconSize: 36,
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // Sign Up Button
              Row(
                mainAxisAlignment: .center,
                spacing: 6,
                children: [
                  Text(
                    'ثبت نام نکردید؟',
                    style: textTheme.labelLarge!.copyWith(
                      color: Colors.blueGrey,
                      fontSize: 14,
                    )
                  ),
                  TextButton(
                    // TODO : change destination page to login/signup form page
                    onPressed: () => Get.offAndToNamed(AppRoutes.home),
                    child: Text(
                      'ثبت نام کنید',
                      style: textTheme.labelLarge!.copyWith(
                        color: AppSolidColors.primary,
                        fontSize: 14,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ),
    );
  }
}