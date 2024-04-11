import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelappdisplay/constants/Helper/image_helper.dart';
import 'package:travelappdisplay/constants/dimentions/color_palette.dart';
import 'package:travelappdisplay/constants/extention/text_extention.dart';
import 'package:travelappdisplay/constants/helper/assets_helper.dart';
import 'package:travelappdisplay/constants/model/image_item.dart';
import 'package:travelappdisplay/ui/booking_hotel_screen.dart';
import 'package:travelappdisplay/widget/app_bar_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static List<ItemImage> itemImage = [
    ItemImage(name: 'Korea', image: AssetHelper.korea, star: '4.5'),
    ItemImage(name: 'Turkey', image: AssetHelper.turkey, star: '4.5'),
    ItemImage(name: 'Dubai', image: AssetHelper.dubai, star: '4.5'),
    ItemImage(name: 'Japan', image: AssetHelper.japan, star: '4.5'),
  ];

  Widget _builtItemCategory(
      Widget icon, Color color, Function() onTap, String title) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: 16.h,
            ),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8.h),
            ),
            child: icon,
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(title),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            AppBarContainer(
              title: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.sp),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi, James!',
                          style: TextStyle(
                              fontFamily: 'Myfont',
                              fontWeight: FontWeight.bold,
                              fontSize: 22.w,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Text(
                          'Where are you going next?',
                          style: TextStyle(
                              fontFamily: 'Myfont',
                              fontSize: 10.w,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(
                      FontAwesomeIcons.bell,
                      size: 14.h,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Container(
                      width: 40.h,
                      height: 40.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.h),
                          color: Colors.white),
                      child: ImageHelper.loadFromAsset(AssetHelper.profile),
                    ),
                  ],
                ),
              ),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search your destination',
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(8.h),
                        child: Icon(
                          FontAwesomeIcons.magnifyingGlass,
                          color: Colors.black,
                          size: 16.w,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(8.h)),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 8.h),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      Expanded(
                        child: _builtItemCategory(
                            ImageHelper.loadFromAsset(AssetHelper.iconHotel,
                                width: 20.w, height: 20.h),
                            Color(0xffFE9C5E), () {
                          // Navigator.of(context).pushNamed(HotelBookingScreen.routeName);
                        }, 'Hotels'),
                      ),
                      SizedBox(
                        width: 24.w,
                      ),
                      Expanded(
                        child: _builtItemCategory(
                            ImageHelper.loadFromAsset(AssetHelper.iconPlane,
                                width: 20.w, height: 20.h),
                            Color(0xffF77777),
                            () {},
                            'Flights'),
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                      Expanded(
                        child: _builtItemCategory(
                            ImageHelper.loadFromAsset(AssetHelper.iconAll,
                                width: 20.w, height: 20.h),
                            Color(0xff3EC8BC),
                            () {},
                            'All'),
                      ),
                    ],
                  ),
                  SizedBox(width: 24.w),
                  Row(
                    children: [
                      Text(
                        'Popular Destinations',
                        style: TextStyles.defaultStyle.bold,
                      ),
                      Spacer(),
                      Text(
                        'See All',
                        style: TextStyles.defaultStyle.bold.primaryTextColor,
                      ),
                    ],
                  ),
                  // ListView.builder(
                  //   shrinkWrap: true,
                  //   itemCount: itemImage.length,
                  //   itemBuilder: (contex, index) {
                  //     return GestureDetector(
                  //       onTap: () {},
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Stack(
                  //             alignment: Alignment.bottomLeft,
                  //             children: [
                  //               Container(
                  //                 width: double.infinity,
                  //                 height: 150.w,
                  //                 decoration: BoxDecoration(
                  //                     image: DecorationImage(
                  //                       image: AssetImage(itemImage[index].image),
                  //                       fit: BoxFit.cover,
                  //                     ),
                  //                     borderRadius: BorderRadius.circular(8.h)),
                  //               ),
                  //               Padding(
                  //                 padding: EdgeInsets.all(8.h),
                  //                 child: Column(
                  //                   crossAxisAlignment: CrossAxisAlignment.start,
                  //                   children: [
                  //                     Text(
                  //                       '${itemImage[index].name}',
                  //                       style: TextStyle(
                  //                         color: Colors.white,
                  //                         fontWeight: FontWeight.bold,
                  //                         fontSize: 16.0,
                  //                       ),
                  //                     ),
                  //                     // Row(
                  //                     //   children: List.generate(itemImage[index].star.toString(), (index) => Icon(Icons.star, color: Colors.yellow)),
                  //                     // ),
                  //                     Row(
                  //                       children: [
                  //                         Icon(Icons.star, color: Colors.yellow),
                  //                         Text(itemImage[index].star.toString())
                  //                       ],
                  //                     ),
                  //                   ],
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ],
                  //       ),
                  //     );
                  //   },
                  // ),
                  MasonryGridView.builder(
                    shrinkWrap: true,
                    itemCount: 4,
                    gridDelegate:
                        const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){
                          Navigator.of(context).pushNamed(BookingHotelScreen.routeName);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Stack(
                              children: [
                                Image.asset('${itemImage[index].image}'),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10.h),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('${itemImage[index].name}',
                                          style: const TextStyle(
                                              color: ColorPalette.whiteColor)),
                                      Container(
                                        width: 60.w,
                                        decoration: BoxDecoration(
                                            color: ColorPalette.whiteColor
                                                .withOpacity(0.8),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 2),
                                          child: Row(
                                            children: [
                                              const Icon(Icons.star,
                                                  color: Color(0xFFFFC107)),
                                              Text('${itemImage[index].star}')
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
