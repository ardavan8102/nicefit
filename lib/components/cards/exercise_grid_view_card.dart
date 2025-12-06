import 'package:flutter/material.dart';
import 'package:nice_fit/consts/colors.dart';
import 'package:nice_fit/models/exercises.dart';

class ExerciseGridViewItem extends StatelessWidget {
  final Exercises value;
  const ExerciseGridViewItem({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.8,
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
        borderRadius: .circular(24),
        image: DecorationImage(
          image: NetworkImage(value.imageUrl!),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // Overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: AppGradientColors.darkOverlay,
                begin: .bottomCenter,
                end: .topCenter,
              ),
              borderRadius: .circular(20),
            ),
          ),

          // Name
          Positioned(
            left: 24,
            bottom: 12,
            child: Text(
              value.title!,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.white,
                fontFamily: 'Rokh',
              ),
            ),
          ),
        ],
      ),
    );
  }
}