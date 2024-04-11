import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:travelappdisplay/constants/dimentions/color_palette.dart';
import 'package:travelappdisplay/ui/home_screen.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key});

  static const routeName = 'main_app_screen';

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  int curentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: curentIndex,
        children: [
          HomeScreen(),
          Container(
            color: Colors.brown,
          ),
          Container(
            color: Colors.pink,
          ),
          Container(
            color: Colors.blueAccent,
          ),
        ],
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: curentIndex,
        onTap: (index) {
          setState(() {
            curentIndex = index;
          });
        },
        unselectedItemColor: ColorPalette.primaryColor.withOpacity(0.2),
        selectedItemColor: ColorPalette.primaryColor,
        margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.w),
        items: [
          SalomonBottomBarItem(
            icon: Icon(FontAwesomeIcons.house), title: Text('Home'),),
          SalomonBottomBarItem(icon: Icon(FontAwesomeIcons.solidHeart), title: Text('Like'),),
          SalomonBottomBarItem(icon: Icon(FontAwesomeIcons.briefcase), title: Text('Booking'),),
          SalomonBottomBarItem(icon: Icon(FontAwesomeIcons.solidUser), title: Text('Profile'),),

        ],

      ),
    );
  }
}
