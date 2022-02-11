import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:sort_it/enum/enum.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpController extends GetxController {
  //-----------------VARIABLES----------------//
  final _auth = FirebaseAuth.instance;
  final userDb = FirebaseFirestore.instance;
  RxString verificationId = ''.obs;
  RxBool isLoading = false.obs;
  RxBool isLoadingForOtp = false.obs;
  RxString passError = ''.obs;
  RxString password = ''.obs;
  final phoneController = TextEditingController();
  final otpController = TextEditingController();

  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  init() async {
    SmsAutoFill().listenForCode;
  }

  void setLoader({required bool newval}) {
    isLoadingForOtp.value = newval;
  }

  String? validatePassword(String value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Enter valid password';
      } else {
        return null;
      }
    }
  }

  ///-----------------------SignIn with Phone and OTP Request------------------///
  signInWithPhone(BuildContext context) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: '+91' + phoneController.text,
      verificationCompleted: (verificationCompleted) async {
        print("-----verification completed--------");
        UserCredential result =
            await _auth.signInWithCredential(verificationCompleted);
        User? user = result.user;

        if (user != null) {
          DocumentSnapshot userCheck =
              await userDb.collection("users").doc(user.uid).get();
          if (userCheck.exists) {
            print("---------user exists------------");

            ///navigate to access permissions page

          } else {
            String? token = await FirebaseMessaging.instance.getToken();
            userDb.collection('users').doc(user.uid).set({
              "id": user.uid,
              "name": user.displayName,
              "email": user.email,
              "tokens": FieldValue.arrayUnion([token])
            });

            ///Push to complete user profile

          }
          Fluttertoast.showToast(msg: 'Successfully signed in');
        } else {
          Fluttertoast.showToast(msg: 'Error signing in');
        }
      },
      verificationFailed: (verificationFailed) {
        print("-----------Login Failed-------");
      },
      codeSent: (verificationID, resendingToken) {
        verificationId.value = verificationID;
        currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
        print("------code sent-----");
        isLoadingForOtp.value = false;
      },
      codeAutoRetrievalTimeout: (codeAutoRetrievalTimeout) {
        print("-----code retrieval--------");
      },
    );
  }

  OtpFillWidget(context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 30.w,
        vertical: 200.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Form(
          child: Column(
        children: [
          Text(
            "OTP Verification",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline1,
          ),
          Text.rich(
            TextSpan(text: 'We have sent code at \n', children: [
              TextSpan(
                  text: '+91${phoneController.text}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, color: Colors.black87)),
              const TextSpan(text: '\n please verify'),
            ]),
            textAlign: TextAlign.center,
          ),
          buildTimer(),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PinFieldAutoFill(
              controller: otpController,
              decoration: UnderlineDecoration(
                textStyle: const TextStyle(fontSize: 20, color: Colors.black),
                colorBuilder: FixedColorBuilder(Colors.black.withOpacity(0.3)),
              ),
              currentCode: otpController.text,
              onCodeSubmitted: (code) {},
              onCodeChanged: (code) {
                if (code!.length == 6) {
                  FocusScope.of(context).unfocus();

                  otpController.text = code;
                  isLoading.value = true;

                  PhoneAuthCredential phoneAuthCredential =
                      PhoneAuthProvider.credential(
                          verificationId: verificationId.value,
                          smsCode: otpController.text);
                  signInWithPhoneAuthCredential(phoneAuthCredential, context);
                  //FocusScope.of(context).requestFocus(FocusNode());
                }
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          !isLoading.value
              ? ElevatedButton(
                  onPressed: () async {
                    PhoneAuthCredential phoneAuthCredential =
                        PhoneAuthProvider.credential(
                            verificationId: verificationId.value,
                            smsCode: otpController.text);
                    signInWithPhoneAuthCredential(phoneAuthCredential, context);
                  },
                  child: const Text('Verify'),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ],
      )),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //Text("This code will expired in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 45.0, end: 0.0),
          duration: const Duration(seconds: 45),
          builder: (_, dynamic value, child) => Text(
            "00:${value.toInt()}",
            style: TextStyle(color: Colors.blue),
          ),
          onEnd: () {},
        ),
      ],
    );
  }

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential, BuildContext context) async {
    try {
      final _authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);
      User? user = _authCredential.user;
      if (user != null) {
        DocumentSnapshot userCheck =
            await userDb.collection("users").doc(user.uid).get();
        if (userCheck.exists) {
          print("user existssssssssssssssssss");

          // navigationService.navigateTo("/access-permission",
          //     withreplacement: true);

        } else {
          String? token = await FirebaseMessaging.instance.getToken();
          userDb.collection('users').doc(user.uid).set({
            "id": user.uid,
            "name": user.displayName,
            "email": user.email,
            "tokens": FieldValue.arrayUnion([token])
          });

          Navigator.of(context).pushNamedAndRemoveUntil(
              '/complete-profile', (Route<dynamic> route) => false);
        }
        Fluttertoast.showToast(msg: 'Successfully signed in');
      } else {
        Fluttertoast.showToast(msg: 'Error signing in');
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  ///----------------------------------Google SignIn--------------------------------///
  // Future<User?> signInWithGoogle() async {
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //   final GoogleSignInAuthentication googleSignInAuthentication =
  //       await googleUser!.authentication;
  //   final credential = GoogleAuthProvider.credential(
  //       accessToken: googleSignInAuthentication.accessToken,
  //       idToken: googleSignInAuthentication.idToken);
  //
  //   //value has data of authenticated user
  //   final UserCredential userCred =
  //       await _auth.signInWithCredential(credential);
  //   final User? user = userCred.user;
  //
  //   if (user != null) {
  //     DocumentSnapshot userCheck =
  //         await userDb.collection("users").doc(user.uid).get();
  //     if (userCheck.exists) {
  //       print("user existssssssssssssssssss");
  //       navigationService.navigateTo("/access-permission",
  //           withreplacement: true);
  //     } else {
  //       String? token = await FirebaseMessaging.instance.getToken();
  //       userDb.collection('users').doc(user.uid).set({
  //         "id": user.uid,
  //         "name": user.displayName,
  //         "email": user.email,
  //         "tokens": FieldValue.arrayUnion([token])
  //       });
  //       navigationService.navigateTo(
  //         "/complete-profile",
  //         withreplacement: true,
  //       );
  //     }
  //     Fluttertoast.showToast(msg:'Successfully Signed in');
  //   } else {
  //     Fluttertoast.showToast(msg:'Error signing in');
  //   }
  //
  //   return user;
  // }

  ///---------------------------------Facebook SignIn-----------------------------///
  // Future signInWithFacebook() async {
  //   final LoginResult loginResult = await FacebookAuth.instance.login();
  //   final OAuthCredential facebookAuthCredential =
  //       FacebookAuthProvider.credential(loginResult.accessToken!.token);
  //
  //   var user = await FirebaseAuth.instance
  //       .signInWithCredential(facebookAuthCredential);
  //   print(user);
  // }
}
