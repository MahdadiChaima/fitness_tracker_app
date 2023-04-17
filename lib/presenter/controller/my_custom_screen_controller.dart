import 'package:get/get.dart';
class MyCustomScreenController extends GetxController {
  int value;
  MyCustomScreenController(this.value);
  void incrementValue() {
    value++;
    update();
  }
}



