import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/style/common_style.dart';
import 'package:flutter_application_1/seections/login/views/screens/login_screen.dart';
import 'package:flutter_application_1/seections/sign_up/get_x/sign_up_logic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignUpLogic signUpLogic = Get.put(SignUpLogic());
  String name = '';
  String nickname = '';
  String email = '';
  String password = '';

  //todo: Firebase Auth를 사용하여 OTP(One-Time Password)를 통한 본인인증

  @override
  Widget build(BuildContext context) {
    double fullWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: commonBackground,
      appBar: AppBar(
        backgroundColor: commonBackground,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(commonPadding),
        child: SizedBox(
          width: fullWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  margin(),
                  textFieldWidget(
                    onChange: (String value) {
                      setState(() {
                        name = value;
                      });
                    },
                    labelText: 'Name',
                  ),
                  margin(),
                  textFieldWidget(
                    onChange: (String value) {
                      setState(() {
                        nickname = value;
                      });
                    },
                    labelText: 'nickname',
                  ),
                  margin(),
                  textFieldWidget(
                    onChange: (String value) {
                      setState(() {
                        email = value;
                      });
                    },
                    labelText: 'email',
                  ),
                  margin(),
                  textFieldWidget(
                    onChange: (String value) {
                      setState(() {
                        password = value;
                      });
                    },
                    labelText: 'Password',
                  ),
                ],
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      signUpLogic.signUp(
                        email: email,
                        password: password,
                        name: name,
                        nickname: nickname,
                      );

                      Get.to<void>(() => const LoginScreen());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: contentBoxColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      alignment: Alignment.center,
                      height: 50.h,
                      width: 300.w,
                      child: Text(
                        '회원가입',
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget textFieldWidget({
    required Function onChange,
    required String labelText,
    double? width,
  }) {
    Color white = Colors.white;
    Color grey = Colors.grey;
    return SizedBox(
      width: width ?? 300.w,
      child: TextField(
        style: const TextStyle(
          height: 2,
          color: Colors.white,
        ),
        onChanged: (value) {
          onChange(value);
        },
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: white,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: grey,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          labelText: labelText,
          labelStyle: TextStyle(
            color: grey,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }

  Widget margin() {
    return const SizedBox(
      height: 40,
    );
  }
}
