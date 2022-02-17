import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sort_it/src/screens/sign_up/sign_up.dart';
import 'package:sort_it/src/screens/welcome/components/welcome_splash.dart';
import 'package:sort_it/controller/welcome_controller.dart';

class Welcome extends StatelessWidget {
  static String routeName = '/welcome';
  Welcome({Key? key}) : super(key: key);
  WelcomeController _welcomeController = Get.put(WelcomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        height: double.infinity,
        width: double.infinity,
        color: Color(0xff1F2E35),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _welcomeController.pc,
                onPageChanged: (index) {
                  _welcomeController.updateIndex(index);
                },
                itemCount: _welcomeController.posters.length,
                itemBuilder: (context, index) {
                  return WelcomeSplash(
                      welcomePoster: _welcomeController.posters[index]);
                },
              ),
            ),
            SizedBox(height: 25.h),
            GetBuilder<WelcomeController>(
              builder: (controller) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...controller.posters.map((poster) {
                      return AnimatedContainer(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        duration: Duration(milliseconds: 350),
                        height: 10,
                        width:
                            poster.index == controller.selectedIndex ? 20 : 10,
                        decoration: BoxDecoration(
                          color: poster.index == controller.selectedIndex
                              ? Color(0xff66C34F)
                              : Color(0xff999999),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      );
                    }).toList(),
                  ],
                );
              },
            ),
            SizedBox(height: 10.h),
            TextButton(
              onPressed: _welcomeController.skipPage,
              child: Text(
                'Skip',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xffBCDDB4),
                  fontFamily: 'abzr',
                ),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
