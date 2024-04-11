import 'package:flutter/cupertino.dart';
import 'package:travelappdisplay/ui/booking_hotel_screen.dart';
import 'package:travelappdisplay/ui/intro_screen.dart';
import 'package:travelappdisplay/ui/main_app_screen.dart';
import 'package:travelappdisplay/ui/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  IntroScreen.routeName: (context) => const IntroScreen(),
  MainAppScreen.routeName: (context) => const MainAppScreen(),
  BookingHotelScreen.routeName: (context) => const BookingHotelScreen(),
};
