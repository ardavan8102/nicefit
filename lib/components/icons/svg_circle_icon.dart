import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nice_fit/consts/colors.dart';

class SvgCircleIcon extends StatelessWidget {
  final String asset;
  const SvgCircleIcon({super.key, required this.asset});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      asset,
      colorFilter: ColorFilter.mode(
        AppSolidColors.primary, .srcIn
      ),
      width: 20,
      height: 20,
    );
  }
}