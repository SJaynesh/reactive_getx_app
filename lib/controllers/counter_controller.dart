import 'package:get/get.dart';

class CounterController extends GetxController {
  RxInt count = 0.obs;
  RxString name = "Jaynesh".obs;
  RxBool isOn = true.obs;
  RxList myName = [].obs;

  void incrementCounter() {
    count.value++;
  }
}
