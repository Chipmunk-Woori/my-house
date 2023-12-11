import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/style/common_style.dart';
import 'package:flutter_application_1/seections/sign_up/get_x/sign_up_logic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String name = '';
  String nickName = '';
  String email = '';
  String password = '';
  SignUpLogic signUpLogic = SignUpLogic();

  //todo: Firebase Auth를 사용하여 OTP(One-Time Password)를 통한 본인인증

  @override
  Widget build(BuildContext context) {
    double fullWidth = MediaQuery.of(context).size.width;
    // firebase.auth().createUserWithEmailAndPassword(email, password);

    return Scaffold(
      backgroundColor: commonBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(commonPadding),
          child: SizedBox(
            width: fullWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    marginTextField(),
                    textFieldWidget(
                      onChange: (String value) {
                        setState(() {
                          name = value;
                        });
                      },
                      labelText: 'Name',
                    ),
                    marginTextField(),
                    textFieldWidget(
                      onChange: (String value) {
                        setState(() {
                          nickName = value;
                        });
                      },
                      labelText: 'NickName',
                    ),
                    marginTextField(),
                    textFieldWidget(
                      onChange: (String value) {
                        setState(() {
                          email = value;
                        });
                      },
                      labelText: 'email',
                    ),
                    marginTextField(),
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
                InkWell(
                  onTap: () {
                    signUpLogic.signUp(email, password);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: contentBoxColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    alignment: Alignment.center,
                    height: 70,
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
              ],
            ),
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

  Widget marginTextField() {
    return const SizedBox(
      height: 40,
    );
  }
}
