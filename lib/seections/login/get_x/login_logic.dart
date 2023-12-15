import 'dart:convert';

import 'package:flutter_application_1/common/enum/storage_manager_key.dart';
import 'package:flutter_application_1/common/widgets/basic_toast.dart';
import 'package:flutter_application_1/firebase/constants.dart';
import 'package:flutter_application_1/seections/splash/views/screens/splash_screen.dart';
import 'package:get/get.dart';
import '../../../common/widgets/basic_logger.dart';
import '../../home/views/screens/home_screen.dart';
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
        (result) async {
          logger.d('=== 로그인 성공 === user 정보 : ${result.user}');

          if (result.user?.uid != null) {
            String refreshToken = result.user?.refreshToken ?? '';
            String uid = result.user?.uid ?? '';

            //유저 정보 로컬스토리지에 저장
            storageManager.write(
              StorageManagerKey.refreshToken.key,
              refreshToken,
            );
            storageManager.write(
              StorageManagerKey.loginStatus.key,
              'true',
            );
            storageManager.write(
              StorageManagerKey.uid.key,
              uid,
            );

            await firebaseFirestore.collection('users').doc(uid).get().then(
              (value) {
                logger.d('=== 로그인 후 uid 값 확인 === $value');
                storageManager.write(
                  StorageManagerKey.user.key,
                  jsonEncode(value),
                );
              },
            );
          } else {
            logger.d('다시 로그인해주세요.');
            // Get.defaultDialog(
            //   title: '다시 로그인해주세요.',
            //   //middleText: 'discription',
            // );
          }
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
      showToast('로그아웃했습니다.');
      Get.to<void>(const SplashScreen());
      //todo 로컬스토리지 전체 삭제
    } catch (e) {
      logger.d(e);
    }
  }
}
