import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umicat_app/src/common/components/getx_listener.dart';
import 'package:umicat_app/src/splash/controller/data_load_controller.dart';
import 'package:umicat_app/src/splash/controller/splash_controller.dart';
import 'package:umicat_app/src/splash/enum/step_type.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dataController = Get.find<DataLoadController>();

    return Scaffold(
      body: Center(
        child: GetxListener<bool>(
          stream: dataController.isDataLoad,
          listen: (value) {
            if (value) {
              controller.changeStep(StepType.authCheck);
            }
          },
          child: GetxListener<StepType>(
            initCall: () => controller.changeStep(StepType.dataLoad),
            stream: controller.loadStep,
            listen: (value) {
              switch (value) {
                case StepType.init:
                case StepType.dataLoad:
                  dataController.loadData();
                  break;
                case StepType.authCheck:
                  break;
              }
            },
            child: Obx(
              () => Text(
                '${controller.loadStep.value.name}�� �Դϴ�.',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.changeStep(StepType.authCheck),
      ),
    );
  }
}
