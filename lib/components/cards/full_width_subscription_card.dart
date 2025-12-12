import 'package:flutter/material.dart';
import 'package:nice_fit/components/snackbars.dart';

class FullWidthSubscriptionCardItem extends StatelessWidget {
  const FullWidthSubscriptionCardItem({
    super.key,
    required this.size,
    required this.textTheme,
    required this.color,
    required this.img,
    required this.label,
    required this.subtext,
  });

  final Size size;
  final TextTheme textTheme;
  final Color color;
  final String img;
  final String label;
  final String subtext;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.2),
        border: Border.all(width: 1, color: color),
        borderRadius: .circular(15),
      ),
      padding: const EdgeInsets.all(10),
      height: size.height * .1,
      child: Row(
        children: [
          // Icon
          Image.asset(
            img,
            width: size.height * .06,
            height: size.height * .06,
          ),
    
          const SizedBox(width: 15),
    
          // Text
          Column(
            crossAxisAlignment: .start,
            mainAxisAlignment: .center,
            spacing: 6,
            children: [
              Text(
                label,
                style: textTheme.bodyLarge!.copyWith(
                  fontWeight: .bold
                ),
              ),
    
              Text(
                subtext,
                style: textTheme.labelSmall,
              ),
            ],
          ),
    
          const Spacer(),
    
          // Button
          InkWell(
            onTap: () {
              AppSnackbars.error(textTheme, 'امکان خرید اشتراک وجود ندارد');
            },
            child: Icon(
              Icons.chevron_right,
              size: 30,
              color: color,
            ),
          )
        ],
      ),
    );
  }
}