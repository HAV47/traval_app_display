import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelappdisplay/constants/dimentions/color_palette.dart';
import 'package:travelappdisplay/constants/extention/text_extention.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, required this.title, this.onTap});

  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.h),
            color: ColorPalette.linearGradient),
        child: Text(
          title,
          style: TextStyles.defaultStyle.bold.whiteTextColor,
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
