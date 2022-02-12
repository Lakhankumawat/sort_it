import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:lottie/lottie.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:sort_it/components/custom_button.dart';
import 'package:sort_it/controller/sign_up_controller.dart';
import 'package:sort_it/src/screens/permission/permission.dart';
import 'package:sort_it/src/screens/success/success.dart';

class Otp extends StatelessWidget {
  static String routeName = '/otp';
  Otp({Key? key}) : super(key: key);

  final SignUpController sc = Get.find();

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
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 40.h),
        child: Form(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Otp Verification",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text.rich(
              TextSpan(text: 'We have sent code at \n\n', children: [
                TextSpan(
                  text: '+91${sc.phoneController.text}',
                  style: Theme.of(context).textTheme.headline3,
                ),
                const TextSpan(text: '\n\n please verify'),
              ]),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(
              height: 10.h,
            ),
            buildTimer(context),
            SizedBox(
              height: 10.h,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 0.3.sh,
                height: 0.3.sh,
                child: Lottie.asset('assets/lottie/scan.json'),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PinFieldAutoFill(
                controller: sc.otpController,
                decoration: UnderlineDecoration(
                  textStyle: Theme.of(context).textTheme.headline2,
                  colorBuilder: FixedColorBuilder(
                    Color.fromRGBO(150, 167, 175, 1),
                  ),
                ),
                currentCode: sc.otpController.text,
                onCodeSubmitted: (code) {},
                onCodeChanged: (code) {
                  if (code!.length == 6) {
                    FocusScope.of(context).unfocus();

                    sc.otpController.text = code;
                    sc.isLoading.value = true;

                    PhoneAuthCredential phoneAuthCredential =
                        PhoneAuthProvider.credential(
                            verificationId: sc.verificationId.value,
                            smsCode: sc.otpController.text);
                    sc.signInWithPhoneAuthCredential(
                        phoneAuthCredential, context);
                    //FocusScope.of(context).requestFocus(FocusNode());
                  }
                },
              ),
            ),
            SizedBox(
              height: 0.1.sh,
            ),
            !sc.isLoading.value
                ? CustomButton(
                    buttonText: 'Verify',
                    textColor: Colors.white,
                    buttonColor: Color.fromRGBO(63, 223, 158, 1),
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(PermissionsPage.routeName);
                    },
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ],
        )),
      ),
    );
  }

  Row buildTimer(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //Text("This code will expired in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 45.0, end: 0.0),
          duration: const Duration(seconds: 45),
          builder: (_, dynamic value, child) => Text(
            "00:${value.toInt()}",
            style: Theme.of(context).textTheme.headline2,
          ),
          onEnd: () {},
        ),
      ],
    );
  }
}
