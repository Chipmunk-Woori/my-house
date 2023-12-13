import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/common/enum/storage_manager_key.dart';
import 'package:flutter_application_1/firebase/constants.dart';
import 'package:flutter_application_1/seections/splash/views/screens/splash_screen.dart';
import 'package:get/get.dart';

import '../../../common/widgets/basic_logger.dart';
import 'login_state.dart';

class LoginLogic extends GetxController {
  final LoginState state = LoginState();

  //이메일 로그인
  void loginEmail(String email, String password) {
    try {
      firebaseAuth
          .signInWithEmailAndPassword(
        email: 'haha51015@naver.com',
        password: 'test12345',
      )
          .then(
        (result) {
          logger.d('로그인 성공! user 정보 : ${result.user}');

          String refreshToken = result.user?.refreshToken ?? '';
          String uid = result.user?.uid ?? '';

          storageManager.write(StorageManagerKey.accessToken.key, refreshToken);
          storageManager.write(StorageManagerKey.uid.key, uid);
        },
      );
    } catch (e) {
      logger.d(e);
    }
  }

  //로그아웃
  void signOut() {
    try {
      firebaseAuth.signOut();
      Get.to<void>(const SplashScreen());
      //todo 로컬스토리지 전체 삭제
    } catch (e) {
      logger.d(e);
    }
  }
}
