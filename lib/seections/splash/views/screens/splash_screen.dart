import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/assets/images/common_images.dart';
import 'package:flutter_application_1/common/style/common_style.dart';
import 'package:flutter_application_1/common/widgets/basic_button.dart';
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
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 260.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BasicButton(
                      title: 'Sign Up',
                      onTap: () {
                        Get.to<void>(() => const SignUpScreen());
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    BasicButton(
                      title: 'Log In',
                      onTap: () {
                        Get.to<void>(() => const LoginScreen());
                      },
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 214.h,
                child: Row(
                  children: [
                    Image.asset(
                      ghostHorn,
                      width: 60.w,
                      height: 60.w,
                    ),
                    Image.asset(
                      ghostHorn,
                      width: 60.w,
                      height: 60.w,
                    ),
                    Image.asset(
                      ghostHorn,
                      width: 60.w,
                      height: 60.w,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
