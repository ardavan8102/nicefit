import 'package:flutter/material.dart';
import 'package:nice_fit/components/appbar.dart';
import 'package:nice_fit/components/fields/search_field.dart';
import 'package:nice_fit/consts/colors.dart';
import 'package:nice_fit/consts/sizes.dart';

class HomeScreenPage extends StatelessWidget {
  const HomeScreenPage({super.key});

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    //var textTheme = Theme.of(context).textTheme;

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

              SliverPadding(
                padding: EdgeInsetsGeometry.fromLTRB(size.width * AppSizes.mainHorizontalPadding, 0, size.width * AppSizes.mainHorizontalPadding, 10),
                sliver: SliverToBoxAdapter(
                  child: CustomSearchField(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}