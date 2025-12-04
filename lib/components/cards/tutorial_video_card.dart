import 'package:flutter/material.dart';
import 'package:nice_fit/consts/colors.dart';
import 'package:nice_fit/models/video.dart';

class TutorialVideoCard extends StatelessWidget {
  final int index;
  final Video video;
  const TutorialVideoCard({super.key, required this.video, required this.index});

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.only(right: 10, left: 20),
      width: size.width,
      height: size.height * .12,
      decoration: BoxDecoration(
        borderRadius: .circular(24),
        color: index == 0 
        ? AppSolidColors.primary
        : Colors.grey.shade300,
      ),
      child: Row(
        spacing: 12,
        children: [
          // Image
          Container(
            height: size.height * .1,
            width: size.width * .22,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(video.imageUrl!),
                fit: BoxFit.cover,
              ),
              borderRadius: .circular(18),
            ),
          ),
        
          // Data Video
          Expanded(
            child: Column(
              spacing: 20,
              crossAxisAlignment: .start,
              mainAxisAlignment: .center,
              children: [
                Text(
                  video.title!,
                  style: textTheme.bodyLarge!.copyWith(
                    fontFamily: 'Rokh',
                    color: index == 0 
                    ? Colors.white
                    : Colors.black,
                  ),
                ),

                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(
                      video.coach!,
                      style: textTheme.labelMedium!.copyWith(
                        fontWeight: .w600,
                        color: index == 0 
                        ? Colors.white.withValues(alpha: 0.7)
                        : Colors.black.withValues(alpha: 0.7),
                      ),
                    ),
                    Text(
                      video.time!,
                      style: textTheme.labelMedium!.copyWith(
                        fontWeight: .w500,
                        color: index == 0 
                        ? Colors.white.withValues(alpha: 0.7)
                        : Colors.black.withValues(alpha: 0.7),
                      ),
                    )
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