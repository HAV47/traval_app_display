// import 'dart:async';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travelappdisplay/constants/Helper/image_helper.dart';
import 'package:travelappdisplay/constants/extention/text_extention.dart';
import 'package:travelappdisplay/constants/helper/assets_helper.dart';
import 'package:travelappdisplay/widget/button_widget.dart';

import 'main_app_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  static String routeName = 'intro_screen';

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  final StreamController<int> _pageStreamController =
      StreamController<int>.broadcast();

  @override
  void initState() {
    _pageController.addListener(() {
      print(_pageController.page);
      _pageStreamController.add(_pageController.page!.toInt());
    });
    super.initState();
  }

  @override
  Widget _buildItemIntroScreen(String image, String title, String description,
      AlignmentGeometry alignment) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            alignment: alignment,
            child: ImageHelper.loadFromAsset(
              image,
              fit: BoxFit.fitHeight,
              height: 400,
            )),
        SizedBox(
          height: 24.h * 2,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyles.defaultStyle),
              SizedBox(
                height: 16.h,
              ),
              Text(
                description,
                style: TextStyles.defaultStyle,
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              _buildItemIntroScreen(
                  AssetHelper.Intro1,
                  'Book a flight',
                  'Found a flight that matches your destination and schedule? Book it instantly.',
                  Alignment.centerRight),
              _buildItemIntroScreen(
                  AssetHelper.Intro2,
                  'Find a hotel room',
                  'Select the day, book your room. We give you the best price.',
                  Alignment.center),
              _buildItemIntroScreen(
                  AssetHelper.Intro3,
                  'Enjoy your trip',
                  'Easy discovering new places and share these between your friends and travel together.',
                  Alignment.centerLeft),
            ],
          ),
          Positioned(
            left: 24.h,
            right: 24.h,
            bottom: 24.h * 2,
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                    effect: ExpandingDotsEffect(
                        dotWidth: 5.h,
                        dotHeight: 5.h,
                        activeDotColor: Colors.orange),
                  ),
                ),
                StreamBuilder<int>(
                  initialData: 0,
                  stream: _pageStreamController.stream,
                  builder: (context, snapshot) {
                    return Expanded(
                      flex: 4,
                      child: ButtonWidget(
                        title: snapshot.data != 2 ? 'Next' : 'Get Started',
                        onTap: () {
                          if (_pageController.page != 2) {
                            _pageController.nextPage(
                                duration: const Duration(microseconds: 200),
                                curve: Curves.easeIn);
                          } else {
                            Navigator.of(context)
                                .pushNamed(MainAppScreen.routeName);
                          }
                        },
                      ),
                    );
                  },
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
