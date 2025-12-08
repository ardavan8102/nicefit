import 'package:flutter/material.dart';
import 'package:nice_fit/components/buttons/back_icon_button.dart';
import 'package:nice_fit/consts/colors.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppSolidColors.scaffoldBG,
      body: SafeArea(
        // Main Column
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            spacing: 40,
            children: [
              // appbar
              Row(
                mainAxisAlignment: .spaceBetween,
                crossAxisAlignment: .center,
                children: [
                  Text(
                    'مطالعه کنید',
                    style: textTheme.titleMedium,
                  ),
                  BackIconButton(),
                ],
              ),

              // Section 1
              Column(
                spacing: 12,
                children: [
                  // Title
                  Row(
                    spacing: 8,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppSolidColors.primary,
                          borderRadius: .circular(10),
                        ),
                        width: 8,
                        height: 20,
                      ),
          
                      Text(
                        'قوانین و شرایط',
                        style: textTheme.titleMedium,
                      )
                    ],
                  ),
          
                  // Text
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است',
                          style: textTheme.labelMedium,
                        ),

                        const WidgetSpan(child: SizedBox(width: 4)),

                        TextSpan(
                          text: 'لورم ایپسوم متن',
                          style: textTheme.labelMedium!.copyWith(
                            color: AppSolidColors.primary,
                          ),
                        ),

                        const WidgetSpan(child: SizedBox(width: 4)),

                        TextSpan(
                          text: 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است',
                          style: textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Section 2
              Column(
                spacing: 12,
                children: [
                  // Title
                  Row(
                    spacing: 8,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppSolidColors.primary,
                          borderRadius: .circular(10),
                        ),
                        width: 8,
                        height: 20,
                      ),
          
                      Text(
                        'اصطلاحات و قواعد',
                        style: textTheme.titleMedium,
                      )
                    ],
                  ),
          
                  // Text
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است',
                          style: textTheme.labelMedium,
                        ),

                        const WidgetSpan(child: SizedBox(width: 4)),

                        TextSpan(
                          text: 'لورم ایپسوم متن',
                          style: textTheme.labelMedium!.copyWith(
                            color: AppSolidColors.primary,
                          ),
                        ),

                        const WidgetSpan(child: SizedBox(width: 4)),

                        TextSpan(
                          text: 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است',
                          style: textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}