import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_storage/src/storage_impl.dart';
import 'package:nice_fit/consts/colors.dart';
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
            height: size.height * .4,
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
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color:  Colors.grey.shade300,
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
                          Container(
                            padding: EdgeInsets.all(6),
                            height: size.height * .05,
                            width: size.height * .05,
                            decoration: BoxDecoration(
                              color: AppSolidColors.primary.withValues(alpha: .2),
                              borderRadius: .circular(100),
                            ),
                            child: SvgPicture.asset(
                              Assets.svg.notification,
                              color: AppSolidColors.primary,
                              width: 20,
                              height: 20,
                            ),
                          ),

                          // Label
                          Text(
                            'اعلانات و پشتیبانی',
                            style: textTheme.labelMedium,
                          )
                        ],
                      ),


                      // Chevron Icon
                      Icon(
                        Icons.chevron_right
                      ),
                      
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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