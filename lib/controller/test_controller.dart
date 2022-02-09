import 'package:get/get.dart';

class TestController extends GetxController {
  RxString newvar = '+91'.obs;

  void updateVal(String newval) {
    newvar.value = newval;
  }
}
