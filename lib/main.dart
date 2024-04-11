import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelappdisplay/constants/dimentions/color_palette.dart';
import 'package:travelappdisplay/routes.dart';
import 'package:travelappdisplay/ui/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          theme: ThemeData(
              primaryColor: ColorPalette.primaryColor,
              scaffoldBackgroundColor: ColorPalette.backgroundScaffoldColor,
              colorScheme: ColorScheme.fromSeed(
                  seedColor: ColorPalette.backgroundScaffoldColor)),
          routes: routes,
          home: SplashScreen(),
        );
      },
    );
  }
}
