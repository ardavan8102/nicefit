import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nice_fit/consts/colors.dart';
import 'package:nice_fit/controllers/page_handler_controller.dart';
import 'package:nice_fit/data/data.dart';
import 'package:nice_fit/views/main/home_screen.dart';

class PageHandlerScreen extends StatefulWidget {
  
  const PageHandlerScreen({super.key});

  @override
  State<PageHandlerScreen> createState() => _PageHandlerScreenState();
}

class _PageHandlerScreenState extends State<PageHandlerScreen> {

  final PageHandlerController pageHandlerController = Get.find<PageHandlerController>();

  late CircularBottomNavigationController bottomNavigationController;

  @override
  void initState() {
    bottomNavigationController = CircularBottomNavigationController(0);
    super.initState();
  }

  final List<Widget> _pages = [

    HomeScreenPage(),

    Center(child: Text('Page 2')), // Acitivities

    Center(child: Text('Page 3')), // Exercises

    Center(child: Text('Page 4')), // Profile

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppSolidColors.scaffoldBG,
      body: SafeArea(
        child: Stack(
          children: [
            // Content
            Obx(
              () => IndexedStack(
                index: pageHandlerController.selectedPageIndex.value,
                children: _pages,
              ),
            ),

            // Bottom nav
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: CircularBottomNavigation(
                tabItems,
                controller: bottomNavigationController,
                selectedCallback: (index) {
                  pageHandlerController.selectedPageIndex.value = index!;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}