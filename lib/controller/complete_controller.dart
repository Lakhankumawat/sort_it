import 'package:get/get.dart';

class CompleteProfileController extends GetxController {
  RxBool passwordState = false.obs;

  void goToPassword({required bool newval}) {
    passwordState.value = true;
  }
}
