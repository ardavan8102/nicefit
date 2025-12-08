import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSnackbars {

  static void error(TextTheme textTheme, String msg){
    Get.snackbar(
      '', 
      '',
      titleText: Row(
        spacing: 6,
        children: [
          Icon(
            Icons.cancel,
            color: Colors.red,
          ),

          Text(
            'خطا',
            style: textTheme.titleSmall!.copyWith(
              color: Colors.red,
            ),
          ),
        ],
      ),
      messageText: Text(
        msg,
        style: textTheme.bodyMedium!.copyWith(
          color: Colors.black,
        ),
      ),
    );
  }

}