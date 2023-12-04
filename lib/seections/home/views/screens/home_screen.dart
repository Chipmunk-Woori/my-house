import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/assets/icons/common_icons.dart';
import 'package:flutter_application_1/common/widgets/text_widget/body_gray_text.dart';
import 'package:flutter_application_1/common/widgets/text_widget/body_text.dart';
import 'package:flutter_application_1/common/widgets/text_widget/head_text.dart';
import 'package:flutter_application_1/seections/home/views/widgets/header_swith.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double commonPadding = 20.w;
  double commonMargin = 30.h;
  //날씨
  String todayDate = '2023 11 29';
  String todayWeather = 'Sunny';
  String location = '서울';
  String welcomeText = 'Hello nour \nwelcome home';
  //Switch
  bool refrigeratorOn = true;
  bool airTemperatureOn = true;
  bool smartLampOn = true;

  List<dynamic> detailedWeather = [
    {
      'title': '현재 온도',
      'data': '1.8°',
    },
    {
      'title': '체감',
      'data': '-0.4°',
    },
    {
      'title': '습도',
      'data': '45% ',
    },
    {
      'title': '바람',
      'data': '남서풍 2m/s',
    },
  ];
  List<dynamic> refrigeratorContents = [
    {'name': 'Tomato', 'acount': '1kg'},
    {'name': 'Oranges', 'acount': '2kg'},
    {'name': 'Papper', 'acount': '2kg'},
    {'name': 'Egg', 'acount': '20'},
    {'name': 'Ice cream', 'acount': '6'},
    {'name': 'Milk', 'acount': '1'},
    {'name': 'Milk', 'acount': '1'},
    {'name': 'Milk', 'acount': '1'},
    {'name': 'Milk', 'acount': '1'},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(commonPadding),
        child: Column(
          children: <Widget>[
            //문구
            SizedBox(
              width: double.maxFinite,
              child: Text(
                welcomeText,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: commonMargin,
            ),

            //날씨
            Container(
              padding: EdgeInsets.symmetric(horizontal: commonPadding, vertical: 12.h),
              width: double.maxFinite,
              height: 155.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(todayDate),
                          Text(location),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          todayWeather,
                          style: TextStyle(
                            fontSize: 23.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 45.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: detailedWeather.length,
                      shrinkWrap: true,
                      itemBuilder: (
                        BuildContext context,
                        int index,
                      ) {
                        return SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.only(right: 40.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${detailedWeather[index]['data']}',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Text(
                                      '${detailedWeather[index]['title']}',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: commonMargin,
            ),

            //스위치들
            SizedBox(
              height: 300.h,
              child: Row(
                children: [
                  Flexible(
                    child: InkWell(
                      onTap: () {
                        print('=====================Nagigator=====================');
                        Navigator.pushNamed(context, "/setting");
                        // goPushPage(context, Routes.lamp);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: commonPadding,
                          vertical: commonPadding,
                        ),
                        // height: double.maxFinite,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Wrap(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HeaderSwitch(
                                  isOn: refrigeratorOn,
                                  icon: fridge,
                                ),
                                SizedBox(height: 43.h),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const HeadText(
                                      title: '냉장고',
                                    ),
                                    SizedBox(height: 24.h),
                                    SizedBox(
                                      height: 150.h,
                                      child: ListView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        itemCount: refrigeratorContents.length,
                                        itemBuilder: (BuildContext context, int index) {
                                          return Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  BodyText(
                                                    title: refrigeratorContents[index]['name'],
                                                  ),
                                                  BodyGrayText(
                                                    title: refrigeratorContents[index]['acount'],
                                                  ),
                                                ],
                                              ),
                                              index != refrigeratorContents.length - 1
                                                  ? SizedBox(
                                                      height: 20.h,
                                                    )
                                                  : const SizedBox(),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Flexible(
                    child: SizedBox(
                      height: double.maxFinite,
                      child: Column(
                        children: [
                          //공기
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: commonPadding,
                                vertical: commonPadding,
                              ),
                              alignment: Alignment.topLeft,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  HeaderSwitch(
                                    isOn: refrigeratorOn,
                                    icon: wind,
                                  ),
                                  Text(
                                    'Air\nTemperature',
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: commonMargin,
                          ),
                          //스마트 조명
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: commonPadding,
                                vertical: commonPadding,
                              ),
                              alignment: Alignment.topLeft,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  HeaderSwitch(
                                    isOn: refrigeratorOn,
                                    icon: ceiling_lamp,
                                  ),
                                  Text(
                                    'Smart\nlamp',
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
