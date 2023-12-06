import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/assets/icons/common_icons.dart';
import 'package:flutter_application_1/common/assets/images/common_images.dart';
import 'package:flutter_application_1/common/style/common_style.dart';
import 'package:flutter_application_1/common/widgets/text_widget/body_gray_text.dart';
import 'package:flutter_application_1/common/widgets/text_widget/body_text.dart';
import 'package:flutter_application_1/common/widgets/text_widget/head_text.dart';
import 'package:flutter_application_1/seections/air/get_x/air_logic.dart';
import 'package:flutter_application_1/seections/home/views/widgets/header_swith.dart';
import 'package:flutter_application_1/seections/lamp/get_x/lamp_logic.dart';
import 'package:flutter_application_1/seections/lamp/views/screens/lamp_screen.dart';
import 'package:flutter_application_1/seections/refrigerator/get_x/refrigerator_logic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final LampLogic lampLogic = Get.put(LampLogic());
  final RefrigeratorLogic refrigeratorLogic = Get.put(RefrigeratorLogic());
  final AirLogic airLogic = Get.put(AirLogic());

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
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     fit: BoxFit.cover,
          //     image: AssetImage(redCloud), // 배경 이미지
          //   ),
          // ),
          child: Padding(
            padding: EdgeInsets.all(commonPadding),
            child: Column(
              children: <Widget>[
                //문구
                // SizedBox(
                //   width: double.maxFinite,
                //   child: Text(
                //     welcomeText,
                //     style: TextStyle(
                //       fontSize: 20.sp,
                //       fontWeight: FontWeight.bold,
                //       color: basicTextColor,
                //     ),
                //   ),
                // ),
                Image.asset(
                  alganzi_2,
                  width: 180,
                  height: 180,
                ),

                //날씨
                Container(
                  padding: EdgeInsets.symmetric(horizontal: commonPadding, vertical: 12.h),
                  width: double.maxFinite,
                  height: 155.h,
                  decoration: BoxDecoration(
                    color: contentBoxColor,
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
                              Text(
                                todayDate,
                                style: const TextStyle(
                                  color: basicTextColor,
                                ),
                              ),
                              Text(
                                location,
                                style: const TextStyle(
                                  color: basicTextColor,
                                ),
                              ),
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
                                color: basicTextColor,
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
                                            color: basicTextColor,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        Text(
                                          '${detailedWeather[index]['title']}',
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            color: basicTextColor,
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
                            Get.to<void>(const LampScreen());
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: commonPadding,
                              vertical: commonPadding,
                            ),
                            // height: double.maxFinite,
                            decoration: BoxDecoration(
                              color: contentBoxColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Wrap(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Obx(() {
                                      //냉장고
                                      return HeaderSwitch(
                                        isOn: refrigeratorLogic.state.refrigeratorOn.value,
                                        icon: fridge,
                                        onTap: refrigeratorLogic.changeRefriOn,
                                      );
                                    }),
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
                                    color: contentBoxColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Obx(() {
                                        //공기
                                        return HeaderSwitch(
                                          isOn: airLogic.state.airOn.value,
                                          icon: wind,
                                          onTap: airLogic.changeAirOn,
                                        );
                                      }),
                                      Text(
                                        'Air\nTemperature',
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                          color: basicTextColor,
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
                                child: InkWell(
                                  onTap: () {
                                    Get.to<void>(const LampScreen());
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: commonPadding,
                                      vertical: commonPadding,
                                    ),
                                    alignment: Alignment.topLeft,
                                    decoration: BoxDecoration(
                                      color: contentBoxColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Obx(() {
                                          //조명
                                          return HeaderSwitch(
                                            isOn: lampLogic.state.lampOn.value,
                                            icon: ceiling_lamp,
                                            onTap: lampLogic.changeLampOn,
                                          );
                                        }),
                                        Text(
                                          'Smart\nlamp',
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.bold,
                                            color: basicTextColor,
                                          ),
                                        ),
                                      ],
                                    ),
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
        ),
      ),
    );
  }
}
