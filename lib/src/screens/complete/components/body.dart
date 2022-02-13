import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:sort_it/components/custom_button.dart';
import 'package:sort_it/controller/complete_controller.dart';
import 'package:sort_it/src/screens/complete/complete_profile.dart';
import 'package:sort_it/src/screens/complete/components/passord_details.dart';
import 'package:sort_it/src/screens/complete/components/user_details.dart';
import 'package:sort_it/src/screens/success/success.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  final CompleteProfileController cp = Get.put(CompleteProfileController());

  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(15, 218, 136, 0.3),
                        offset: Offset(0, 2),
                        blurRadius: 10)
                  ],
                  gradient: LinearGradient(
                      begin: Alignment(0, 1),
                      end: Alignment(-1, 0),
                      colors: [
                        Color.fromRGBO(63, 223, 158, 1),
                        Color.fromRGBO(62, 213, 152, 1)
                      ]),
                ),
                child: Image.asset('assets/images/logo.png'),
              ),
              cp.passwordState.value ? PasswordDetails() : UserDetails(),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: CustomButton(
                      buttonText: '',
                      textColor: Color.fromRGBO(63, 223, 158, 1),
                      buttonColor: Color(0xFF286053),
                      leading: false,
                      onTap: () {
                        if (cp.passwordState.value) {
                          cp.goToPassword(newval: false);
                        } else {
                          Get.close(1);
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Flexible(
                    flex: 4,
                    child: CustomButton(
                      buttonText: 'Next',
                      textColor: Colors.white,
                      buttonColor: Color.fromRGBO(63, 223, 158, 1),
                      leading: true,
                      onTap: () {
                        if (cp.passwordState.value) {
                          Get.toNamed(Success.routeName);
                        } else {
                          cp.goToPassword(newval: true);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
