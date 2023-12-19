import 'dart:convert';

import 'package:flutter_application_1/common/enum/storage_manager_key.dart';
import 'package:flutter_application_1/common/widgets/basic_toast.dart';
import 'package:flutter_application_1/firebase/constants.dart';
import 'package:flutter_application_1/seections/home/views/screens/home_screen.dart';
import 'package:flutter_application_1/seections/login/views/screens/login_screen.dart';
import 'package:flutter_application_1/seections/sign_up/get_x/sign_up_state.dart';
import 'package:get/get.dart';
import '../../../common/widgets/basic_logger.dart';

class SignUpLogic extends GetxController {
  final SignUpState state = SignUpState();

  void signUp({
    required String email,
    required String password,
    required String name,
    required String nickname,
  }) {
    try {
      firebaseAuth
          .createUserWithEmailAndPassword(
        email: 'haha51015@naver.com',
        password: 'test12345',
      )
          .then(
        (result) async {
          logger.d('=== 회원가입 성공 === user 정보 : ${result.user}');
          if (result.user?.uid != null) {
            result.user?.updateDisplayName(name);
            String refreshToken = result.user?.refreshToken ?? '';
            String uid = result.user?.uid ?? '';

            //회원가입 과정에서 입력한 유저 정보
            Map<String, String> userData = {
              'name': name,
              'nickname': nickname,
              'email': email,
            };

            //유저 정보 FireStore에 저장
            await firebaseFirestore.collection('users').doc(uid).set(userData);

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
            await storageManager.write(
              StorageManagerKey.user.key,
              jsonEncode(userData),
            );

            showToast('회원가입 완료되었습니다.');
            logger.d('회원 가입 완료 : $result');
          }
        },
      );
    } catch (e) {
      showErrorToast('회원가입 에러');
      logger.d(e);
    }
  }

  void testStorage() async {
    String? uid = await storageManager.read(StorageManagerKey.user.key);

    String name = 'woori';
    String nickname = 'testNickname';
    String email = 'haha51015@naver.com';

    //회원가입 과정에서 입력한 유저 정보
    Map<String, String> userData = {
      'name': name,
      'nickname': nickname,
      'email': email,
    };

    //유저 정보 FireStore에 저장
    await firebaseFirestore.collection('users').doc(uid).set(userData);
  }
}
