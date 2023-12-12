import 'package:flutter_application_1/common/widgets/basic_toast.dart';
import 'package:flutter_application_1/firebase/constants.dart';
import 'package:flutter_application_1/seections/sign_up/get_x/sign_up_state.dart';
import 'package:get/get.dart';

import '../../../common/widgets/basicLogger.dart';

class SignUpLogic extends GetxController {
  final SignUpState state = SignUpState();

  void signUp(String email, String password) {
    try {
      firebaseAuth
          .createUserWithEmailAndPassword(
        email: 'haha51015@naver.com',
        password: 'test12345',
      )
          .then(
        (result) {
          showToast('회원가입 완료되었습니다.');
          logger.d('회원 가입 완료 : $result');
        },
      );
    } catch (e) {
      showErrorToast('회원가입 에러');
      logger.d(e);
    }
  }
}
