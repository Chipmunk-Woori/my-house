import 'package:flutter_application_1/seections/air/get_x/air_state.dart';
import 'package:get/get.dart';

class AirLogic extends GetxController {
  final AirState state = AirState();

  void changeAirOn() {
    state.airOn.toggle();
  }
}
