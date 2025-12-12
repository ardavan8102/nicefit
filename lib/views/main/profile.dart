import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:nice_fit/components/buttons/full_width_orange_button.dart';
import 'package:nice_fit/components/buttons/social_button.dart';
import 'package:nice_fit/components/cards/full_width_subscription_card.dart';
import 'package:nice_fit/components/fields/ticket_form_field.dart';
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

                // Card : About App
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
                            bottomSheetCardTitle(textTheme, 'درباره ${AppStrings.brandName}'),

                            const SizedBox(height: 12),

                            Text(
                              AppStrings.aboutAppDescription,
                              style: textTheme.bodyMedium,
                              textAlign: .center,
                            ),

                            const SizedBox(height: 24),

                            FullWidthAccentColorButton(textTheme: textTheme, label: 'دربــاره سازنــده'),

                            const SizedBox(height: 20),

                            DualSocialButtonInBottomSheet(
                              textTheme: textTheme,
                              size: size,
                            ),

                            const SizedBox(height: 24),
                          ],
                        ),
                      ),
                    );
                  },
                  Assets.svg.heart,
                ),

                // Card : Subscription
                profileMenuItemCard(
                  size,
                  textTheme,
                  AppStrings.buySubcription,
                  (){
                    Get.bottomSheet(
                      BottomSheetContainerForGETX(
                        size: size,
                        content: Column(
                          crossAxisAlignment: .center,
                          mainAxisAlignment: .center,
                          children: [
                            bottomSheetCardTitle(textTheme, 'کاربر ویژه ما شوید'),

                            const SizedBox(height: 10),

                            Text(
                              'با خرید هرکدام از اشتراک های زیر از مزایای ویژه‌ای برخوردار شوید :)',
                              style: textTheme.bodyMedium!.copyWith(
                                height: 2
                              ),
                              textAlign: .center,
                            ),

                            const SizedBox(height: 24),

                            // Subs
                            BottomSheetSubscriptionCards(size: size, textTheme: textTheme),

                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
                    );
                  },
                  Assets.svg.wallet,
                ),

                // Card : Send Ticket
                profileMenuItemCard(
                  size,
                  textTheme,
                  AppStrings.appSupport,
                  (){
                    Get.bottomSheet(
                      BottomSheetContainerForGETX(
                        size: size,
                        content: Column(
                          crossAxisAlignment: .center,
                          mainAxisAlignment: .center,
                          children: [
                            bottomSheetCardTitle(textTheme, 'ارسال درخواست'),

                            const SizedBox(height: 20),

                            // Form
                            SendTicketBottomSheetForm(),
                          
                            const SizedBox(height: 18),

                            // Button Submit
                            FullWidthAccentColorButton(textTheme: textTheme, label: 'ارسال نهایی'),

                            const SizedBox(height: 30),

                          ],
                        ),
                      ),
                    );
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

  Text bottomSheetCardTitle(TextTheme textTheme, String msg) {
    return Text(
      msg,
      style: textTheme.headlineLarge!.copyWith(
        fontSize: 24,
        color: AppSolidColors.primary,
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

class SendTicketBottomSheetForm extends StatelessWidget {
  const SendTicketBottomSheetForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 18,
      children: [
        // Name & Phone
        Row(
          spacing: 18,
          children: [
            Expanded(
              child: FormFieldWidget(
                keyboardType: .name,
                hintText: 'اردوان اسکندری',
                labelText: 'نام شما',
              ),
            ),
    
            Expanded(
              child: FormFieldWidget(
                keyboardType: .phone,
                hintText: '09123456789',
                labelText: 'تلفن شما',
              ),
            ),
          ],
        ),
      
        Column(
          spacing: 18,
          children: [
            // Email
            FormFieldWidget(
              keyboardType: .emailAddress,
              hintText: 'ardavaneskandari007@gmail.com',
              labelText: 'ایمیل شما',
            ),
    
            // Request Text
            FormFieldWidget(
              keyboardType: .multiline,
              hintText: 'پیگیری تراکنش 12345',
              labelText: 'درخواست شما',
            ),
          ],
        ),
      ],
    );
  }
}

class BottomSheetSubscriptionCards extends StatelessWidget {
  const BottomSheetSubscriptionCards({
    super.key,
    required this.size,
    required this.textTheme,
  });

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        // Bronze  sub
        FullWidthSubscriptionCardItem(
          size: size,
          textTheme: textTheme,
          color: AppSolidColors.bronze,
          label: 'اشتراکــ بـرونــزی',
          subtext: 'تا 180 روز از مزایای vip برخودار شوید',
          img: Assets.image.bronzeStar.path,
        ),
    
        // Diamond sub
        FullWidthSubscriptionCardItem(
          size: size,
          textTheme: textTheme,
          color: AppSolidColors.diamond,
          label: 'اشتراکــ الــمــاسیـــ',
          subtext: 'تا 360 روز از مزایای vip برخودار شوید',
          img: Assets.image.diamondHeart.path,
        ),
      ],
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
        SocialCustomButtonWithIcon(
          textTheme: textTheme,
          label: 'گیت هاب',
          bgColor: Colors.black,
          textColor: Colors.white,
          icon: HugeIcons.strokeRoundedGithub,
          function: () {
    
          },
        ),
    
        SocialCustomButtonWithIcon(
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