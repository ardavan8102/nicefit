import 'package:flutter/material.dart';
import 'package:nice_fit/components/buttons/simple_button.dart';
import 'package:nice_fit/models/ads.dart';

class AdsSliderCard extends StatelessWidget {

  final Ads ads;

  const AdsSliderCard({super.key, required this.ads});

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(ads.imageUrl!),
          fit: BoxFit.cover,
          alignment: .topCenter,
        ),
        borderRadius: .circular(16),
      ),
      child: Stack(
        children: [
          // Dark Overlay
          Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withValues(alpha: 0.7),
                  Colors.black.withValues(alpha: 0.5),
                  Colors.black.withValues(alpha: 0.3),
                  Colors.transparent,
                  Colors.transparent,
                ],
                begin: .centerRight,
                end: .centerLeft,
              ),
              borderRadius: .circular(16),
            ),
          ),

          // Content
          Container(
            padding: EdgeInsets.only(right: 24),
            height: size.height,
            width: size.width * .6,
            child: Column(
              mainAxisAlignment: .spaceEvenly,
              crossAxisAlignment: .start,
              children: [
                Text(
                  ads.title!,
                  style: textTheme.titleMedium!.copyWith(
                    fontFamily: 'Rokh',
                    color: Colors.white,
                  ),
                ),

                SimpleButton(
                  func: (){},
                  text: 'مشاهده',
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}