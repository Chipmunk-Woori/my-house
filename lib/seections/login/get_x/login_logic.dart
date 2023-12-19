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
            await storageManager.write(
              StorageManagerKey.refreshToken.key,
              refreshToken,
            );
            await storageManager.write(
              StorageManagerKey.loginStatus.key,
              'true',
            );
            await storageManager.write(
              StorageManagerKey.uid.key,
              uid,
            );

            await firebaseFirestore.collection('users').doc(uid).get().then(
              (value) {
                storageManager.write(
                  StorageManagerKey.user.key,
                  jsonEncode(value),
                );
              },
            );

            Get.to<void>(() => const HomeScreen());
          } else {
            logger.d('다시 로그인해주세요.');
            showToast('다시 로그인해주세요.');
          }
        },
      );
    } catch (e) {
      showErrorToast('로그인 에러');
      logger.d(e);
    }
  }

  //로그아웃
  void signOut() async {
    try {
      await firebaseAuth.signOut();
      await storageManager.delete(StorageManagerKey.refreshToken.key);
      await storageManager.delete(StorageManagerKey.loginStatus.key);
      await storageManager.delete(StorageManagerKey.uid.key);
      await storageManager.delete(StorageManagerKey.user.key);

      showToast('로그아웃했습니다.');
      Get.to<void>(() => const SplashScreen());
    } catch (e) {
      showErrorToast('로그아웃 에러');
      logger.d(e);
    }
  }
}
