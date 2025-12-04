import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nice_fit/components/cards/ads_slider_card.dart';
import 'package:nice_fit/consts/colors.dart';
import 'package:nice_fit/data/data.dart';
import 'package:nice_fit/models/ads.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomVerticalSlider extends StatefulWidget {
  const CustomVerticalSlider({super.key});

  @override
  State<CustomVerticalSlider> createState() => _CustomVerticalSliderState();
}

class _CustomVerticalSliderState extends State<CustomVerticalSlider> {

  int currentSliderIndex = 0;

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: size.height * .2,
      child: Stack(
        children: [
          // Slider
          SizedBox(
            width: size.width,
            height: size.height * .2,
            child: CarouselSlider.builder(
              itemCount: adsList.length,
              itemBuilder: (context, index, realIndex) {
                Ads ads = adsList[index];
                return AdsSliderCard(ads: ads);
              },
              options: CarouselOptions(
                scrollDirection: .vertical,
                enlargeCenterPage: true,
                viewportFraction: 1,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 1500),
                reverse: true,
                onPageChanged: (int index, CarouselPageChangedReason reason) {
                  setState(() {
                    currentSliderIndex = index;
                  });
                },
              ),
            ),
          ),

          // Indicator
          Positioned(
            bottom: 0,
            top: 0,
            left: 16,
            child: SizedBox(
              height: size.height,
              child: Center(
                child: sliderIndicatorSwapEffect(size),
              ),
            ),
          )
        ],
      ),
    );
  }

  AnimatedSmoothIndicator sliderIndicatorSwapEffect(Size size) {
    return AnimatedSmoothIndicator(
      axisDirection: .vertical,
      activeIndex: currentSliderIndex,
      count: adsList.length,
      effect: SwapEffect(
        dotColor: Colors.white,
        activeDotColor: AppSolidColors.primary,
        dotHeight: size.height * .02,
        dotWidth: size.height * .02,
      ),
    );
  }
}