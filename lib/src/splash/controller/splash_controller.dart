import 'package:get/get.dart';
import 'package:umicat_app/src/splash/enum/step_type.dart';

class SplashController extends GetxController {
  final Rx<StepType> loadStep = StepType.dataLoad.obs;

  void changeStep(StepType type) {
    loadStep.value = type;
  }
}
