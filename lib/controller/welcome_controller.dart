import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sort_it/model/welcome_model.dart';
import 'package:sort_it/src/screens/sign_up/sign_up.dart';

class WelcomeController extends GetxController {
  ///-----------Page Controller PC ------------------///
  PageController pc = PageController();

  List<WelcomePoster> posters = [
    WelcomePoster(
        image: 'assets/images/splash/1 (5).png',
        heading: 'TRUST',
        caption:
            'We have trained staff and ISO Marked machines for accurate results',
        index: 0),
    WelcomePoster(
        image: 'assets/images/splash/1 (2).png',
        heading: 'TIME CONVINIENT',
        caption:
            'You\'re busy? Don\'t worry! We would come to you as per your time convenience',
        index: 1),
    WelcomePoster(
        image: 'assets/images/splash/1 (4).png',
        heading: 'EARN',
        caption: 'Give away your waste and earn on top of it!',
        index: 2),
    WelcomePoster(
        image: 'assets/images/splash/1 (3).png',
        heading: 'CATEGORIES',
        caption: 'Choose from Extensive range of categories we have to offer',
        index: 3),
    WelcomePoster(
        image: 'assets/images/splash/1 (6).png',
        heading: 'REGULATED PRICES',
        caption: 'We offer Accurate Market Prices',
        index: 4),
    WelcomePoster(
        image: 'assets/images/splash/1 (1).png',
        heading: 'RECYCLE',
        caption:
            'We strongly believe nothing is waste, Everything has a right place',
        index: 5),
  ];

  int selectedIndex = 0;

  void updateIndex(int val) {
    selectedIndex = val;
    update();
  }

  void skipPage() {
    Get.offAllNamed(SignUp.routeName);
  }

  ///----------------Code For auto animation from the start of the screen-----------------///
  ///---------------------May not be useful in some cases , so in hold -------------------///
  // @override
  // void initState() {
  //   _welcomeController.animateSlider(0, context);
  //   super.initState();
  // }
  //
  // void animateSlider(int nextPage, BuildContext context) {
  //   Future.delayed(Duration(seconds: 1)).then((_) {
  //     if (nextPage == posters.length) {
  //       skipPage();
  //     }
  //     if (pc.hasClients)
  //       pc
  //           .animateToPage(nextPage,
  //               duration: Duration(milliseconds: 800), curve: Curves.easeOut)
  //           .then((_) => animateSlider(nextPage + 1, context));
  //   });
  // }
}
