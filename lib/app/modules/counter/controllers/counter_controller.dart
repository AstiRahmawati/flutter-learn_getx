import 'package:get/get.dart';

class CounterController extends GetxController {
  //TODO: Implement CounterController

  final count = 0.obs;

  void increment() {
    if (count.value >=50) {
      Get.snackbar("error", "Jangan terus ditambah");
    } else {
      count.value++;
    }
  }

  void decrement() {
    if (count.value <= 1){
      Get.snackbar("error", "Jangan terus dikurang");
    } else {
      count.value--;
    }
  }
}
