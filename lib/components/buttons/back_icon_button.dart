import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nice_fit/consts/colors.dart';

class BackIconButton extends StatelessWidget {
  const BackIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppSolidColors.primary,
        borderRadius: .circular(10),
      ),
      child: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(
          CupertinoIcons.right_chevron,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}