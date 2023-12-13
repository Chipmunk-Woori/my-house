import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/style/common_style.dart';
import 'package:flutter_application_1/seections/login/get_x/login_logic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginLogic loginLogic = Get.put(LoginLogic());
  String email = '';
  String password = '';

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
                      loginLogic.loginEmail(email, password);
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
                        '로그인',
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
