import 'package:flutter/material.dart';
import 'package:nice_fit/models/tutorial.dart';

class TutorialImageCard extends StatelessWidget {
  final Tutorial tutorial;
  const TutorialImageCard({super.key, required this.tutorial});

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return Container(
      margin: EdgeInsets.only(left: 12),
      width: size.width * .7,
      height: size.height * .2,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(tutorial.imageUrl!),
          fit: BoxFit.cover,
        ),
        borderRadius: .circular(16),
      ),
      child: Stack(
        children: [
          // Dark Overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withValues(alpha: 0.7),
                  Colors.black.withValues(alpha: 0.5),
                  Colors.black.withValues(alpha: 0.3),
                  Colors.transparent,
                  Colors.transparent,
                ],
                begin: .bottomCenter,
                end: .topCenter,
              ),
              borderRadius: .circular(16)
            ),
          ),

          Positioned(
            right: 16,
            bottom: 16,
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  tutorial.title!,
                  style: textTheme.titleSmall!.copyWith(
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '${tutorial.countVideos!} ویدیو',
                      style: textTheme.labelMedium!.copyWith(
                        color: Colors.white.withValues(alpha: 0.65),
                      ),
                    ),
                    Text(
                      '، ${tutorial.minsVideo!} دقیقه آموزش',
                      style: textTheme.labelMedium!.copyWith(
                        color: Colors.white.withValues(alpha: 0.65),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}