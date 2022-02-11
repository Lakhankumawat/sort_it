import 'package:get/get.dart';

import 'package:sort_it/model/welcome_model.dart';

class WelcomeController extends GetxController {
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
}
