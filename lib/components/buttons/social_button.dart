import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class SocialCustomButtonWithIcon extends StatelessWidget {
  const SocialCustomButtonWithIcon({
    super.key,
    required this.textTheme, required this.label, required this.bgColor, required this.textColor, required this.function, required this.icon,
  });

  final String label;
  final Color bgColor;
  final Color textColor;
  final TextTheme textTheme;
  final List<List<dynamic>> icon;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 60,
        child: ElevatedButton(
          onPressed: function, // TODO : Add url launcher
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(bgColor),
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
              borderRadius: .circular(14),
            )),
          ),
          child: Row(
            crossAxisAlignment: .center,
            mainAxisAlignment: .center,
            spacing: 10,
            children: [
              HugeIcon(
                icon: icon,
                size: 24,
                color: Colors.white,
              ),

              Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: Text(
                  label,
                  style: textTheme.labelMedium!.copyWith(
                    color: textColor,
                    fontWeight: .w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}