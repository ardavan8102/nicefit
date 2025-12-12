import 'package:flutter/material.dart';
import 'package:nice_fit/consts/colors.dart';

class FullWidthAccentColorButton extends StatelessWidget {
  const FullWidthAccentColorButton({
    super.key,
    required this.textTheme, required this.label,
  });

  final TextTheme textTheme;
  final String label;

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
          label,
          style: textTheme.labelLarge!.copyWith(
            color: Colors.white
          ),
        ),
      ),
    );
  }
}