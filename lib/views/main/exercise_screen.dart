import 'package:flutter/material.dart';
import 'package:nice_fit/components/cards/exercise_grid_view_card.dart';
import 'package:nice_fit/consts/colors.dart';
import 'package:nice_fit/data/data.dart';

class ExerciseScreen extends StatelessWidget {
  const ExerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.only(bottom: 50),
      width: size.width,
      height: size.height,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),//hsni_sima
          slivers: [
            // Title
            SliverToBoxAdapter(
              child: titleSection(textTheme),
            ),
          
            // Grid View
            SliverPadding(
              padding: const EdgeInsetsGeometry.fromLTRB(0, 20, 0, 20),
              sliver: SliverToBoxAdapter(
                child: SizedBox(
                  height: size.height / 1.5,
                  width: size.width,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 24,
                    ),
                    itemCount: exercisesList.length,
                    itemBuilder: (context, index) {
                      final item = exercisesList[index];
                      return ExerciseGridViewItem(value: item);
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  

  // - - - -  Title Section - - - -
  Row titleSection(TextTheme textTheme) {
    return Row(
      spacing: 4,
      children: [
        Text(
          'لیستــ',
          style: textTheme.headlineLarge!.copyWith(
            fontSize: 24,
          ),
        ),
        Text(
          'تمریــن هــا',
          style: textTheme.headlineLarge!.copyWith(
            fontSize: 24,
            color: AppSolidColors.primary,
          ),
        ),
      ],
    );
  }
}