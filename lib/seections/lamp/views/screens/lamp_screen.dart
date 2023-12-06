import 'dart:math';
import 'package:flutter_application_1/seections/lamp/get_x/lamp_logic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/style/common_style.dart';

class LampScreen extends StatefulWidget {
  const LampScreen({super.key});

  @override
  State<LampScreen> createState() => _LampScreenState();
}

class _LampScreenState extends State<LampScreen> {
  final LampLogic lampLogic = Get.put(LampLogic());
  MyClipper myClipper = MyClipper();
  Color backgroundColor = commonBackground;
  @override
  Widget build(BuildContext context) {
    double fullWidth = MediaQuery.of(context).size.width.w;
    double fullHeight = MediaQuery.of(context).size.height.h;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          width: fullWidth,
          height: fullHeight,
          color: backgroundColor,
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Obx(
                () {
                  return SleekCircularSlider(
                    min: 0,
                    max: 100,
                    initialValue: lampLogic.state.lampLight.value,
                    appearance: CircularSliderAppearance(
                      spinnerDuration: 10,
                      // startAngle: 180,
                      // angleRange: 180,
                      customWidths: CustomSliderWidths(
                        trackWidth: 2,
                        progressBarWidth: 20,
                        handlerSize: 5,
                        shadowWidth: 40,
                      ),
                      customColors: CustomSliderColors(
                        progressBarColors: circularSliderColor,
                        dotColor: Colors.white,
                        trackColor: Colors.white,
                        shadowColor: Color.fromARGB(111, 255, 255, 255),
                        shadowStep: 20,
                        shadowMaxOpacity: 0.1,
                      ),
                      infoProperties: InfoProperties(
                        topLabelText: '${lampLogic.state.lampLight.value.floor()}',
                        topLabelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 50.sp,
                        ),
                        mainLabelStyle: TextStyle(
                          fontSize: 0.sp,
                        ),
                      ),
                      size: fullWidth / 2,
                    ),
                    onChangeEnd: (value) {
                      lampLogic.changeLampLight(value);
                    },
                  );
                },
              )
              // ClipPath(
              //   clipper: MyClipper(),
              //   child: Container(
              //     width: fullWidth,
              //     height: fullHeight / 2,
              //     color: pointColor,
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    Path path = Path()
      ..moveTo(0, 0)
      ..quadraticBezierTo(w / 3, 0, 5 * w / 12, h / 4)
      ..quadraticBezierTo(w / 2, h / 2, 7 * w / 12, h / 4)
      ..quadraticBezierTo(2 * w / 3, 0, w, 0)
      ..lineTo(w, h)
      ..lineTo(0, h)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
