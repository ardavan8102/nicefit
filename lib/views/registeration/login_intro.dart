import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nice_fit/components/buttons/full_width_social_button.dart';
import 'package:nice_fit/routes/getx_routes.dart';
import 'package:nice_fit/consts/colors.dart';
import 'package:nice_fit/consts/strings.dart';
import 'package:nice_fit/gen/assets.gen.dart';

class LoginIntroPage extends StatelessWidget {
  LoginIntroPage({super.key});

  final TextEditingController usernameEditingController = TextEditingController();

  final storage = GetStorage();

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppSolidColors.scaffoldBG,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: .center,
              children: [
                
                const SizedBox(height: 40),

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
            
                // Submit Name
                Column(
                  spacing: 24,
                  children: [
                    SizedBox(
                      width: size.width / 1.2,
                      height: size.height / 15,
                      child: TextField(
                        controller: usernameEditingController,
                        style: textTheme.labelMedium,
                        decoration: InputDecoration(
                          hintText: 'نام و نام خانوادگی',
                          hintStyle: textTheme.labelMedium!.copyWith(
                            color: Colors.blueGrey.shade300
                          ),
                          border: .none,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: AppSolidColors.primary.withValues(alpha: 0.4),
                            ),
                            borderRadius: .circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: AppSolidColors.primary,
                            ),
                            borderRadius: .circular(12),
                          ),
                        ),
                      ),
                    ),
            
                    FullWidthCustomButton(
                      size: size,
                      backGroundColor: Colors.black,
                      borderColor: Colors.black,
                      radius: .circular(12),
                      icon: Icons.login,
                      foregroundColor: Colors.white,
                      buttonText: 'وارد شوید',
                      iconSize: 36,
                      func: () {
                        storage.write('username', usernameEditingController.text);
                        Get.offAndToNamed(AppRoutes.pageHandler);
                      },
                    ),
                  ],
                ),
            
                const SizedBox(height: 24),
            
                // Privacy Policy
                Row(
                  mainAxisAlignment: .center,
                  children: [
                    Text(
                      'با ورود به برنامه',
                      style: textTheme.labelLarge!.copyWith(
                        color: Colors.blueGrey,
                        fontSize: 12,
                      )
                    ),
                    TextButton(
                      onPressed: () => Get.toNamed(AppRoutes.privacyPolicy),
                      child: Text(
                        'قوانین حریم خصوصی',
                        style: textTheme.labelLarge!.copyWith(
                          color: AppSolidColors.primary,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Text(
                      'را میپذیرید',
                      style: textTheme.labelLarge!.copyWith(
                        color: Colors.blueGrey,
                        fontSize: 12,
                      )
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}