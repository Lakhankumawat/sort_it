import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:lottie/lottie.dart';
import 'package:sort_it/components/custom_button.dart';
import 'package:sort_it/controller/permission_controller.dart';
import 'package:sort_it/src/screens/choice/choice.dart';
import 'package:sort_it/src/screens/complete/complete_profile.dart';

class PermissionsPage extends StatelessWidget {
  static String routeName = '/permissions';
  PermissionsPage({Key? key}) : super(key: key);

  final PermissionController pc = Get.put(PermissionController());

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
                'Enable Location',
                style: Theme.of(context).textTheme.headline1,
              ),
              Container(
                width: 0.3.sh,
                height: 0.3.sh,
                child: Lottie.asset('assets/lottie/location.json'),
              ),
              Text(
                'We need to know your location in order to suggest nearby stations',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline2,
              ),
              CustomButton(
                buttonText: 'Enable',
                textColor: Colors.white,
                buttonColor: Color.fromRGBO(63, 223, 158, 1),
                leading: true,
                onTap: () {
                  pc.getPermission(context);
                  Navigator.of(context).pushNamed(Choice.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
