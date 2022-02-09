import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt selectedIndex = 0.obs;
  final PageController pageController = PageController();

  void onTappedBar(int value) {
    selectedIndex.value = value;
    pageController.animateToPage(selectedIndex.value,
        duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
  }
}
