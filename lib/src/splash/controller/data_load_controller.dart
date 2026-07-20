import 'package:get/get.dart';

class DataLoadController extends GetxController {
  final RxBool isDataLoad = false.obs;

  Future<void> loadData() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    isDataLoad.value = true;
  }
}
