import 'package:flutter/material.dart';
import 'package:nice_fit/consts/app_styles.dart';

class FullWidthCustomButton extends StatelessWidget {
  final Size size;
  final Color backGroundColor;
  final Color borderColor;
  final BorderRadiusGeometry radius;
  final IconData icon;
  final Color foregroundColor;
  final String buttonText;
  final double iconSize;
  final Function() func;

  const FullWidthCustomButton({
    super.key,
    required this.size,
    required this.backGroundColor,
    required this.borderColor,
    required this.radius,
    required this.icon,
    required this.foregroundColor,
    required this.buttonText,
    required this.iconSize,
    required this.func
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width / 1.2,
      height: size.height / 15,
      child: ElevatedButton(
        onPressed: func,
        style: ButtonStyle(
          elevation: WidgetStateProperty.all(0),
          backgroundColor: WidgetStateProperty.all(backGroundColor),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: radius,
              side: BorderSide(
                width: 1, 
                color: borderColor
              ),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: .center,
          spacing: 10,
          children: [
            Icon(
              icon,
              size: iconSize,
              color: foregroundColor
            ),

            Text(
              buttonText,
              style: AppButtonStyles.fullWidthSocialButtonTextStyle(foregroundColor),
            ),
          ],
        ),
      ),
    );
  }
}
