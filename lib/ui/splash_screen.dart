import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelappdisplay/constants/helper/assets_helper.dart';
import 'package:travelappdisplay/constants/helper/image_helper.dart';
import 'package:travelappdisplay/ui/intro_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static String routeName = '/splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState()  {
    super.initState();
    Future.delayed(Duration(seconds: 5),(){
      Navigator.of(context).pushNamed(IntroScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ImageHelper.loadFromAsset(AssetHelper.BackgroundSplash,
              fit: BoxFit.fitWidth),
        ),
        Positioned.fill(child: Image.asset(AssetHelper.circleSplash))
      ],
    );
  }
}
