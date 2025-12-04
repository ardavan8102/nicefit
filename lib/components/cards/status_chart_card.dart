import 'package:circle_chart/circle_chart.dart';
import 'package:flutter/material.dart';
import 'package:nice_fit/models/activity.dart';

class StatusChartCard extends StatelessWidget {
  final Activity activity;

  const StatusChartCard({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return Container(
      margin: EdgeInsets.only(left: 24),
      width: size.width * .35,
      height: size.height * .21,
      decoration: BoxDecoration(
        color: activity.color!.withValues(alpha: .2),
        borderRadius: .circular(15),
      ),
      child: Column(
        mainAxisAlignment: .spaceEvenly,
        children: [
          // Title
          Text(
            activity.title!,
            style: textTheme.labelLarge!.copyWith(
              fontFamily: 'Rokh',
              fontSize: 12,
            ),
          ),

          // Chart
          SizedBox(
            width: size.width,
            height: size.height * .1,
            child: Stack(
              alignment: .center,
              children: [
                CircleChart(
                  progressNumber: activity.count!,
                  maxNumber: activity.manxCount!,
                  progressColor: activity.color,
                  backgroundColor: Colors.white,
                  rateTextStyle: TextStyle(
                    color: Colors.transparent
                  ),
                  height: size.height * .1,
                  width: size.width * .4,
                  animationDuration: Duration(seconds: 3),
                ),

                Icon(
                  activity.icon,
                  color: activity.color,
                  size: 32,
                ),
              ],
            ),
          ),
        
          // Chart Data
          Column(
            mainAxisAlignment: .center,
            children: [
              Row(
                mainAxisAlignment: .center,
                spacing: 8,
                children: [
                  Text(
                    activity.count!.toString(),
                    style: textTheme.labelLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: activity.color
                    ),
                  ),
                  Text(
                    activity.unit!,
                    style: textTheme.labelSmall!.copyWith(
                      color: Colors.black.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),

              Text(
                activity.status!,
                style: textTheme.labelSmall!.copyWith(
                  color: Colors.black.withValues(alpha: 0.7),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}