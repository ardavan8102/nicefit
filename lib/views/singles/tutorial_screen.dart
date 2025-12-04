import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nice_fit/components/buttons/back_icon_button.dart';
import 'package:nice_fit/components/cards/tutorial_video_card.dart';
import 'package:nice_fit/consts/colors.dart';
import 'package:nice_fit/data/data.dart';
import 'package:nice_fit/models/tutorial.dart';
import 'package:nice_fit/models/video.dart';

class TutorialSingleScreen extends StatelessWidget {
  final Tutorial tutorial;
  const TutorialSingleScreen({super.key, required this.tutorial});

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    
    return Scaffold(
      backgroundColor: AppSolidColors.scaffoldBG,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Video & Icons
              Stack(
                children: [
                  // Image
                  Container(
                    width: size.width,
                    height: size.height * .35,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(tutorial.imageUrl!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
          
                  // Icons Row
                  Positioned(
                    top: size.height * .08,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 24, left: 24),
                      child: Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Icon(
                            CupertinoIcons.heart,
                            size: 30,
                          ),
                          BackIconButton(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
          
              const SizedBox(height: 32),
          
              // Page Content
              Padding(
                padding: const EdgeInsets.only(right: 24, left: 24),
                child: Column(
                  children: [
                    
                    // Tutorial Information
                    Column(
                      spacing: 12,
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          tutorial.title!,
                          style: textTheme.titleLarge,
                        ),
          
                        Text(
                          tutorial.content!,
                          style: textTheme.bodyMedium!.copyWith(
                            color: Colors.black.withValues(alpha: 0.7),
                          ),
                        ),
                      ],
                    ),
          
                    const SizedBox(height: 10),
                  
                    // Videos List View
                    SizedBox(
                      width: size.width,
                      height: size.height,
                      child: ListView.builder(
                        physics: ClampingScrollPhysics(),
                        itemCount: videoList.length,
                        itemBuilder: (context, index) {
                          final Video video = videoList[index];
                          return TutorialVideoCard(video: video, index: index);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}