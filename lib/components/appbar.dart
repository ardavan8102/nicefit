import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nice_fit/consts/sizes.dart';
import 'package:nice_fit/consts/strings.dart';
import 'package:nice_fit/gen/assets.gen.dart';
import 'package:nice_fit/views/registeration/login_intro.dart';

class NiceFitAppBar extends StatelessWidget {
  NiceFitAppBar({super.key});

  final username = LoginIntroPage().storage.read('username');

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.only(right: size.width * 0.05, left: size.width * 0.05),
      margin: EdgeInsets.only(top: 10, bottom: 16),
      width: size.width,
      height: size.height * .1,
      // Main app bar row
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          // Profile Row
          Row(
            spacing: 12,
            children: [
              Container(
                width: AppSizes.appbarProfileImageSize,
                height: AppSizes.appbarProfileImageSize,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Assets.image.profile.path),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: .circular(10),
                ),
              ),

              // User Name
              Column(
                spacing: 4,
                mainAxisAlignment: .center,
                crossAxisAlignment: .start,
                children: [
                  Text(
                    AppStrings.greetingsText,
                    style: textTheme.labelMedium,
                  ),

                  SizedBox(
                    width: size.width * .5,
                    child: Text(
                      username,
                      style: textTheme.labelLarge!.copyWith(
                        fontFamily: 'Rokh'
                      ),
                      overflow: .ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),

          // Actions
          Container(
            margin: EdgeInsets.only(top: 6),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: .circular(10),
              border: Border.all(
                width: 1,
                color: Colors.grey.shade400,
              ),
            ),
            child: Icon(
              CupertinoIcons.bell,
            )
          ),
        ],
      ),
    );
  }
}