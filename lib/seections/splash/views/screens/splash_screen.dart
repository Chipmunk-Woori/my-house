import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/style/common_style.dart';
import 'package:flutter_application_1/seections/login/views/screens/login_screen.dart';
import 'package:flutter_application_1/seections/sign_up/views/screens/sign_up_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    double fullWidth = MediaQuery.of(context).size.width;
    double fullHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: commonBackground,
      body: Padding(
        padding: EdgeInsets.all(commonPadding),
        child: SizedBox(
          width: fullWidth,
          height: fullHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Get.to<void>(() => const SignUpScreen());
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: contentBoxColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  alignment: Alignment.center,
                  height: 70,
                  width: fullWidth * 0.7,
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Get.to<void>(() => const LoginScreen());
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: contentBoxColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  alignment: Alignment.center,
                  height: 70,
                  width: fullWidth * 0.7,
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
