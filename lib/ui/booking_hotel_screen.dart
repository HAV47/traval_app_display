import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelappdisplay/constants/helper/assets_helper.dart';
import 'package:travelappdisplay/widget/app_bar_container.dart';
import 'package:travelappdisplay/widget/item_booking_widget.dart';

class BookingHotelScreen extends StatefulWidget {
  const BookingHotelScreen({super.key});

  static String routeName = 'booking_hotel_screen';

  @override
  State<BookingHotelScreen> createState() => _BookingHotelScreenState();
}

class _BookingHotelScreenState extends State<BookingHotelScreen> {
  String? dateSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBarContainer(
            titleString: ('Hotel Booking'),
            iconLeft: true,
            paddingContent: EdgeInsets.all(16.h),
          ),
          SizedBox(height: 24.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: Column(
              children: [
                ItemBookingWidget(
                    icon: AssetHelper.iconLocation,
                    title: 'Description',
                    description: 'South Korea'),
                SizedBox(height: 24.h),
                StatefulBuilder(
                  builder: (context, setState) {
                    return ItemBookingWidget(
                      icon: AssetHelper.iconCelender,
                      title: 'Select Date',
                      description: dateSelected ?? '13 Feb - 18 Feb 2021',
                      onTap: () {
                        // Navigator.of(context).pushNamed(SelectDateScreen.routeName);
                      },
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
