import 'package:flutter/material.dart';
import 'package:nice_fit/consts/colors.dart';

class SimpleButton extends StatelessWidget {
  final Function() func;
  final String text;
  const SimpleButton({super.key, required this.func, required this.text});

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: func,
      child: Container(
        width: size.width * .3,
        height: size.height * .05,
        decoration: BoxDecoration(
          borderRadius: .circular(12),
          color: AppSolidColors.primary,
        ),
        child: Center(
          child: Text(
            text,
            style: textTheme.labelMedium!.copyWith(
              color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}