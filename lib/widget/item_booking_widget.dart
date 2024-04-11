import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemBookingWidget extends StatelessWidget {
  const ItemBookingWidget(
      {super.key,
        required this.icon,
        required this.title,
        required this.description,
        this.onTap
      });

  final String icon;
  final String title;
  final String description;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(8.h),
          ),
        ),
        child: Row(
          children: [
            Image.asset(
              icon,
              height: 35,
              width: 35,
            ),
            SizedBox(
              width: 8.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(description,
                  style: TextStyle(fontWeight: FontWeight.bold,),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
