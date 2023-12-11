import 'package:flutter_application_1/seections/lamp/get_x/lamp_state.dart';
import 'package:get/get.dart';

class LampLogic extends GetxController {
  final LampState state = LampState();

  void changeLampOn() {
    state.lampOn.toggle();
  }

  void changeLampLight(double light) {
    state.lampLight = light.obs;
  }
}
