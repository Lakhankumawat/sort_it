import 'package:get/get.dart';

class SettingsController extends GetxController {
  RxBool darkMode = true.obs;
  RxBool playInBg = false.obs;
  void changeMode() {
    darkMode.value = !darkMode.value;
  }

  void changeBgMode() {
    playInBg.value = !playInBg.value;
  }
}
