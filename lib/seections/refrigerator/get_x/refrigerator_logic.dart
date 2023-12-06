import 'package:flutter_application_1/seections/refrigerator/get_x/refrigerator_state.dart';
import 'package:get/get.dart';

class RefrigeratorLogic extends GetxController {
  final RefrigeratorState state = RefrigeratorState();

  void changeRefriOn() {
    state.refrigeratorOn.toggle();
  }
}
