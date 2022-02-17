import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:lottie/lottie.dart';
import 'package:sort_it/components/custom_button.dart';
import 'package:sort_it/src/screens/complete/complete_profile.dart';

class Choice extends StatelessWidget {
  static String routeName = '/choice';
  const Choice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(0.6, 0.7),
              end: Alignment(-0.7, 0.6),
              colors: [
                Color.fromRGBO(34, 52, 60, 1),
                Color.fromRGBO(31, 46, 53, 1)
              ]),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 0.1.sw,
            vertical: 0.1.sh,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'I am here to',
                style: Theme.of(context).textTheme.headline1,
              ),
              Container(
                width: 0.3.sh,
                height: 0.3.sh,
                child: Lottie.asset('assets/lottie/garbage.json'),
              ),
              Text(
                'Please mention your use type',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline2,
              ),
              CustomButton(
                buttonText: 'Dump garbage',
                textColor: Colors.white,
                buttonColor: Color.fromRGBO(63, 223, 158, 1),
                leading: true,
                onTap: () {
                  ///Setting the type for further details of user in user db
                  Get.toNamed(CompleteProfile.routeName);
                },
              ),
              CustomButton(
                buttonText: 'Collect Garbage',
                textColor: Color.fromRGBO(63, 223, 158, 1),
                buttonColor: Color(0xFF286053),
                leading: false,
                onTap: () {
                  ///Setting the type for further details of collector in db
                  Get.toNamed(CompleteProfile.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
