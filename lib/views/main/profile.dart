import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:nice_fit/components/icons/svg_circle_icon.dart';
import 'package:nice_fit/consts/colors.dart';
import 'package:nice_fit/consts/strings.dart';
import 'package:nice_fit/gen/assets.gen.dart';
import 'package:nice_fit/views/registeration/login_intro.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    final storage = LoginIntroPage().storage;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          // title page
          Text(
            'حساب کاربری',
            style: textTheme.titleMedium,
          ),

          const SizedBox(height: 24),

          // profile card
          profileCard(size, storage, textTheme),

          const SizedBox(height: 40),

          // Settings Cards
          Container(
            width: size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                width: 1,
                color: Colors.grey.shade300
              ),
              borderRadius: .circular(20),
            ),
            child: Column(
              children: [
                // Card 1
                profileMenuItemCard(
                  size,
                  textTheme,
                  AppStrings.notificationSection,
                  (){
                    Get.bottomSheet(
                      BottomSheetContainerForGETX(
                        size: size,
                        content: Column(
                          children: [

                          ],
                        ),
                      ),
                    );
                  },
                  Assets.svg.notification,
                ),

                // Card 2
                profileMenuItemCard(
                  size,
                  textTheme,
                  AppStrings.aboutApp,
                  (){
                    Get.bottomSheet(
                      BottomSheetContainerForGETX(
                        size: size,
                        content: Column(
                          crossAxisAlignment: .center,
                          mainAxisAlignment: .center,
                          children: [
                            Text(
                              'درباره ${AppStrings.brandName}',
                              style: textTheme.headlineLarge!.copyWith(
                                fontSize: 24,
                                color: AppSolidColors.primary,
                              ),
                            ),

                            const SizedBox(height: 12),

                            Text(
                              AppStrings.aboutAppDescription,
                              style: textTheme.bodyMedium,
                              textAlign: .center,
                            ),

                            const SizedBox(height: 24),

                            AboutCreatorButtonInBottomSheet(textTheme: textTheme),

                            const SizedBox(height: 20),

                            DualSocialButtonInBottomSheet(
                              textTheme: textTheme,
                              size: size,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  Assets.svg.heart,
                ),

                // Card 3
                profileMenuItemCard(
                  size,
                  textTheme,
                  AppStrings.buySubcription,
                  (){
                    
                  },
                  Assets.svg.wallet,
                ),

                // Card 4
                profileMenuItemCard(
                  size,
                  textTheme,
                  AppStrings.appSupport,
                  (){

                  },
                  Assets.svg.letter,
                  true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget profileMenuItemCard(
    Size size,
    TextTheme textTheme,
    String label,
    Function()? function,
    String svg, [
    bool isLast = false,
  ]) {
    return GestureDetector(
      onTap: function,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color:  isLast ? Colors.transparent : Colors.grey.shade300
            )
          ),
        ),
        height: size.height * .1,
        width: size.width * .75,
        // Card Data
        child: Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            // Icon & label
            Row(
              spacing: 12,
              children: [
                // Icon
                svgItemIcon(size, svg),
      
                // Label
                Text(
                  label,
                  style: textTheme.labelMedium,
                )
              ],
            ),
      
            // Chevron Icon
            const Icon(
              Icons.chevron_right
            ),
            
          ],
        ),
      ),
    );
  }

  Container svgItemIcon(Size size, String asset) {
    return Container(
      padding: EdgeInsets.all(6),
      height: size.height * .05,
      width: size.height * .05,
      decoration: BoxDecoration(
        color: AppSolidColors.primary.withValues(alpha: .2),
        borderRadius: .circular(100),
      ),
      child: SvgCircleIcon(asset: asset)
    );
  }

  Container profileCard(Size size, GetStorage storage, TextTheme textTheme) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
      decoration: BoxDecoration(
        color: AppSolidColors.primary,
        borderRadius: .circular(16),
        boxShadow: [
          BoxShadow(
            color: AppSolidColors.primary.withValues(alpha: 0.4),
            offset: Offset(0, 10),
            blurRadius: 30,
          ),
        ],
      ),
      width: size.width,
      height: size.height * .12,
      child: Row(
        children: [
          // Image
          Container(
            width: size.width * .2,
            height: size.width * .2,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.image.profile.path)
              ),
              borderRadius: .circular(12),
            ),
          ),

          const SizedBox(width: 15),

          Column(
            spacing: 8,
            mainAxisAlignment: .center,
            crossAxisAlignment: .start,
            children: [
              // User name
              Row(
                mainAxisAlignment: .spaceBetween,
                crossAxisAlignment: .center,
                spacing: 12,
                children: [
                  Text(
                    storage.read('username'),
                    style: textTheme.bodyLarge!.copyWith(
                      color: Colors.white
                    ),
                    overflow: .ellipsis,
                    maxLines: 1,
                  ),

                  // Change name on press
                  GestureDetector(
                    onTap: () {
                      
                    },
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              // Date
              Text(
                'اولین ورود ${storage.read('join_date')}',
                style: textTheme.labelMedium!.copyWith(
                  color: Colors.white.withValues(alpha: .7)
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DualSocialButtonInBottomSheet extends StatelessWidget {
  const DualSocialButtonInBottomSheet({
    super.key, required this.textTheme, required this.size,
  });

  final TextTheme textTheme;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        SocialButtonForBottomSheet(
          textTheme: textTheme,
          label: 'گیت هاب',
          bgColor: Colors.black,
          textColor: Colors.white,
          icon: HugeIcons.strokeRoundedGithub,
          function: () {
    
          },
        ),
    
        SocialButtonForBottomSheet(
          textTheme: textTheme,
          label: 'لینکدیـن',
          bgColor: Colors.blue,
          textColor: Colors.white,
          icon: HugeIcons.strokeRoundedLinkedin02,
          function: () {
    
          },
        ),
      ],
    );
  }
}

class SocialButtonForBottomSheet extends StatelessWidget {
  const SocialButtonForBottomSheet({
    super.key,
    required this.textTheme, required this.label, required this.bgColor, required this.textColor, required this.function, required this.icon,
  });

  final String label;
  final Color bgColor;
  final Color textColor;
  final TextTheme textTheme;
  final List<List<dynamic>> icon;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 60,
        child: ElevatedButton(
          onPressed: function,
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(bgColor),
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
              borderRadius: .circular(14),
            )),
          ),
          child: Row(
            crossAxisAlignment: .center,
            mainAxisAlignment: .center,
            spacing: 10,
            children: [
              HugeIcon(
                icon: icon,
                size: 24,
                color: Colors.white,
              ),

              Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: Text(
                  label,
                  style: textTheme.labelMedium!.copyWith(
                    color: textColor,
                    fontWeight: .w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AboutCreatorButtonInBottomSheet extends StatelessWidget {
  const AboutCreatorButtonInBottomSheet({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: (){
    
        },
        style: ButtonStyle(
          elevation: WidgetStateProperty.all(0),
          backgroundColor: WidgetStateProperty.all(AppSolidColors.primary),
          shape: WidgetStateProperty.all(RoundedRectangleBorder(
            borderRadius: .circular(16),
          )),
        ),
        child: Text(
          'درباره سازنده',
          style: textTheme.labelLarge!.copyWith(
            color: Colors.white
          ),
        ),
      ),
    );
  }
}

class BottomSheetContainerForGETX extends StatelessWidget {
  
  const BottomSheetContainerForGETX({
    super.key,
    required this.size,
    required this.content,
  });

  final Size size;
  final Column content;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: .only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      height: size.height / 2,
      width: size.width,
      child: content,
    );
  }
}