import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:sort_it/controller/settings_controller.dart';
import 'package:sort_it/src/screens/profile/profile.dart';
import 'package:sort_it/src/screens/settings/components/bottomContainer.dart';
import 'components/body.dart';

class Settings extends StatelessWidget {
  static String routeName = '/settings';

  final SettingsController sc = Get.put(SettingsController());
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
          padding: EdgeInsets.symmetric(vertical: 50.w),
          child: SingleChildScrollView(
            child: Column(
              //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.maxFinite,
                  height: 70.h,
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(48, 68, 78, 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 33.h,
                        width: 33.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color(0xFFFFC542),
                        ),
                        child: Center(
                          child: Text(
                            '⭕',
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Alice Smith',
                            style:
                                Theme.of(context).textTheme.headline2!.copyWith(
                                      color: Colors.white,
                                    ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            '91 23 456 7890',
                            style:
                                Theme.of(context).textTheme.headline2!.copyWith(
                                      color: Colors.white,
                                    ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            'randommail@gmail.com',
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          Get.toNamed(Profile.routeName);
                        },
                        icon: Icon(
                          FontAwesomeIcons.angleRight,
                          color: Color.fromRGBO(150, 167, 175, 1),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Body(),
                SizedBox(
                  height: 15.h,
                ),
                BottomContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
