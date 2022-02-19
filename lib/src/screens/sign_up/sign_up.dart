import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:lottie/lottie.dart';
import 'package:sort_it/components/custom_button.dart';
import 'package:sort_it/components/phone_field.dart';
import 'package:sort_it/controller/sign_up_controller.dart';
import 'package:sort_it/src/screens/sign_up/components/otp.dart';
import 'package:sort_it/src/screens/success/success.dart';

class SignUp extends StatelessWidget {
  static String routeName = '/sign-up';

  final SignUpController sc = Get.put(SignUpController());

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 0.3.sh,
                  height: 0.3.sh,
                  child: Lottie.asset('assets/lottie/otp.json'),
                ),
              ),
              Text(
                'Sign Up',
                style: Theme.of(context).textTheme.headline1,
              ),
              Text(
                'to start working',
                style: Theme.of(context).textTheme.headline2,
              ),
              PhoneField(hint: '98', controller: sc.phoneController),
              CustomButton(
                buttonText: 'Next',
                textColor: Colors.white,
                buttonColor: Color.fromRGBO(63, 223, 158, 1),
                leading: true,
                onTap: () {
                  Navigator.of(context).pushNamed(Otp.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
