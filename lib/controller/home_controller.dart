import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //-------------------VARIABLES-----------------------------//
  ///Purpose of this global key is nothing other than opening drawer
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  RxInt selectedIndex = 0.obs;
  final PageController pageController = PageController();

  void onTappedBar(int value) {
    selectedIndex.value = value;
    pageController.animateToPage(selectedIndex.value,
        duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  RxBool isOpened = false.obs;

  void changeOpenState({required bool newval}) {
    isOpened.value = newval;
  }
}
