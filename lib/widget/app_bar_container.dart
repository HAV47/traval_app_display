import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelappdisplay/constants/Helper/image_helper.dart';
import 'package:travelappdisplay/constants/dimentions/color_palette.dart';
import 'package:travelappdisplay/constants/extention/text_extention.dart';
import 'package:travelappdisplay/constants/helper/assets_helper.dart';

class AppBarContainer extends StatelessWidget {
  const AppBarContainer(
      {super.key,
        this.child,
      this.title,
      this.iconLeft = false,
      this.iconRight = false,
      this.titleString,
      this.subTitleString,
      this.paddingContent});

  final Widget? child;
  final Widget? title;
  final bool iconLeft;
  final bool iconRight;
  final String? titleString;
  final String? subTitleString;
  final EdgeInsets? paddingContent;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          SizedBox(
            height: 200,
            child: AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              toolbarHeight: 100,
              backgroundColor: ColorPalette.backgroundScaffoldColor,
              title: title ??
                  Row(
                    children: [
                      if (iconLeft)
                        Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16.h)),
                              color: Colors.white),
                          padding: EdgeInsets.all(10.h),
                          child: Icon(
                            FontAwesomeIcons.arrowLeft,
                            color: Colors.black,
                            size: 16.sp,
                          ),
                        ),
                      Expanded(
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                titleString ?? '',
                                style: TextStyles.defaultStyle.fontHeader
                                    .whiteTextColor.bold,
                              ),
                              if (subTitleString != null)
                                Padding(
                                  padding: EdgeInsets.only(top: 16.h),
                                  child: Text(
                                    subTitleString!,
                                    style: TextStyles.defaultStyle.fontCaption
                                        .whiteTextColor,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      if (iconRight)
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.h),
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(10.h),
                          child: Icon(
                            FontAwesomeIcons.bars,
                            size: 16.h,
                            color: Colors.black,
                          ),
                        ),
                    ],
                  ),
              flexibleSpace: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: Gradients.defaultGradientBackground,
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(35))),
                  ),
                  Positioned(
                      top: 0,
                      left: 0,
                      child: ImageHelper.loadFromAsset(AssetHelper.oval1)),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: ImageHelper.loadFromAsset(AssetHelper.oval2)),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 160),
            padding: EdgeInsets.symmetric(horizontal: 24.h),
            child: child,
          ),
        ],
      ),
    );
  }
}
