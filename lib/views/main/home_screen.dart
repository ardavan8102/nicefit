import 'package:flutter/material.dart';
import 'package:nice_fit/components/appbar.dart';
import 'package:nice_fit/components/cards/status_chart_card.dart';
import 'package:nice_fit/components/fields/search_field.dart';
import 'package:nice_fit/components/vertical_slider.dart';
import 'package:nice_fit/consts/colors.dart';
import 'package:nice_fit/consts/sizes.dart';
import 'package:nice_fit/consts/strings.dart';
import 'package:nice_fit/data/data.dart';
import 'package:nice_fit/models/activity.dart';

class HomeScreenPage extends StatelessWidget {
  const HomeScreenPage({super.key});

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppSolidColors.scaffoldBG,
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: CustomScrollView(
            slivers: [
              // Appbar
              SliverToBoxAdapter(
                child: NiceFitAppBar(),
              ),
              
              // Search Field
              SliverPadding(
                padding: EdgeInsetsGeometry.fromLTRB(size.width * AppSizes.mainHorizontalPadding, 0, size.width * AppSizes.mainHorizontalPadding, 10),
                sliver: SliverToBoxAdapter(
                  child: CustomSearchField(),
                ),
              ),
              

              // Slider Carousel
              SliverPadding(
                padding: EdgeInsetsGeometry.fromLTRB(size.width * AppSizes.mainHorizontalPadding, 12, size.width * AppSizes.mainHorizontalPadding, 10),
                sliver: SliverToBoxAdapter(
                  child: CustomVerticalSlider(),
                ),
              ),

              // Chart Cards
              SliverPadding(
                padding: EdgeInsetsGeometry.fromLTRB(size.width * AppSizes.mainHorizontalPadding, 12, size.width * AppSizes.mainHorizontalPadding, 10),
                sliver: SliverToBoxAdapter(
                  child: SizedBox(
                    width: size.width,
                    child: statusChartCardsSection(textTheme, size),
                  ),
                ),
              ),


              // Tutorials List

            ],
          ),
        ),
      ),
    );
  }


  // Status Chart Cards
  Column statusChartCardsSection(TextTheme textTheme, Size size) {
    return Column(
      spacing: 16,
      // Title
      children: [
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text(
              AppStrings.statusChartCardsTitle,
              style: textTheme.titleMedium,
            ),

            TextButton(
              onPressed: () {},
              child: Text(
                AppStrings.seeAllButtonText,
                style: textTheme.labelMedium!.copyWith(
                  color: AppSolidColors.primary.withValues(alpha: 0.6),
                ),
              ),
            ),
          ],
        ),

        //Chatrs List View
        SizedBox(
          width: size.width,
          height: size.height * .21,
          child: ListView.builder(
            itemCount: activityList.length,
            scrollDirection: .horizontal,
            itemBuilder: (context, index) {
              Activity activity = activityList[index];

              return StatusChartCard(activity: activity);
            },
          ),
        ),
      ],
    );
  }
}