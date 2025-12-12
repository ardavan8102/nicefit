import 'package:flutter/material.dart';
import 'package:nice_fit/consts/colors.dart';

class FormFieldWidget extends StatelessWidget {
  const FormFieldWidget({
    super.key, required this.keyboardType, required this.hintText, required this.labelText,
  });

  final TextInputType keyboardType;
  final String hintText;
  final String labelText;


  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      onSubmitted: (_) {
        FocusScope.of(context).nextFocus();
      },
      enableInteractiveSelection: true,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(
          color: AppSolidColors.silver.withValues(alpha: .7)
        ),
        hintStyle: TextStyle(
          color: AppSolidColors.silver.withValues(alpha: .9)
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: .circular(10),
          borderSide: BorderSide(
            color: AppSolidColors.primary,
            width: 1,
          )
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: .circular(10),
          borderSide: BorderSide(
            color: AppSolidColors.silver.withValues(alpha: .7),
            width: 1,
          )
        )
      ),
    );
  }
}