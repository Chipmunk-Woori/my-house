import 'package:flutter_application_1/common/widgets/basic_logger.dart';
import 'package:flutter_application_1/common/widgets/text_widget/body_gray_text.dart';
import 'package:flutter_application_1/common/widgets/text_widget/body_text.dart';
import 'package:flutter_application_1/seections/home/views/screens/home_screen.dart';
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
  Color backgroundColor = commonBackground; //commonBackground
  List<dynamic> todo = [
    {'done': false, 'title': '설거지 하기'},
    {'done': true, 'title': '성검전설 보기'},
    {'done': false, 'title': '잠옷 빨래하기'},
    {'done': false, 'title': '감기약 먹기'},
    {'done': false, 'title': '설거지 하기'},
    {'done': true, 'title': '성검전설 보기'},
    {'done': false, 'title': '잠옷 빨래하기'},
    {'done': false, 'title': '감기약 먹기'},
    {'done': false, 'title': '설거지 하기'},
    {'done': true, 'title': '성검전설 보기'},
    {'done': false, 'title': '잠옷 빨래하기'},
    {'done': false, 'title': '감기약 먹기'},
  ];
  @override
  Widget build(BuildContext context) {
    double fullWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: commonBackground,
      appBar: AppBar(
        backgroundColor: backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(commonPadding),
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
                      startAngle: 90,
                      angleRange: 360,
                      customWidths: CustomSliderWidths(
                        trackWidth: 2,
                        progressBarWidth: 10,
                        handlerSize: 5,
                        shadowWidth: 40,
                      ),
                      customColors: CustomSliderColors(
                        // progressBarColors: circularSliderColor,
                        progressBarColor: Colors.white,
                        dotColor: Colors.white,
                        trackColor: Colors.white,
                        shadowColor: Colors.white,
                        shadowStep: 20,
                        shadowMaxOpacity: 0.1,
                      ),
                      infoProperties: InfoProperties(
                        mainLabelStyle: TextStyle(
                          fontSize: 30.sp,
                          color: Colors.white,
                        ),
                      ),
                      size: fullWidth / 2,
                    ),
                    onChangeEnd: (value) {
                      lampLogic.changeLampLight(value);
                    },
                  );
                },
              ),
              const SizedBox(
                height: 50,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: todo.length,
                itemBuilder: (BuildContext context, int index) {
                  return CheckboxListTile(
                    visualDensity: VisualDensity(horizontal: 0, vertical: 3),
                    side: const BorderSide(
                      color: Colors.white,
                    ),
                    activeColor: Colors.white,
                    checkColor: Colors.black,
                    controlAffinity: ListTileControlAffinity.leading,
                    title: BodyText(
                      title: todo[index]['title'],
                    ),
                    value: todo[index]['done'],
                    onChanged: (value) {
                      setState(() {
                        todo[index]['done'] = value;
                      });
                    },
                  );
                },
              ),
              const SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {
                  Get.to(const HomeScreen());
                },
                child: const Text(
                  'homeScreen',
                  style: TextStyle(color: Colors.white),
                ),
              ),
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
