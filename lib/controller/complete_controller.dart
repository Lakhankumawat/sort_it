import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CompleteProfileController extends GetxController {
  RxBool passwordState = false.obs;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  void goToPassword({required bool newval}) {
    passwordState.value = true;
  }
}
