import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:sort_it/constant/constant.dart' as constant;
import 'package:sort_it/controller/settings_controller.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  final SettingsController sc = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 110.h,
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.h),
      decoration: BoxDecoration(
        color: Color.fromRGBO(48, 68, 78, 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: sc.changeMode,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => Container(
                    height: 17.h,
                    width: 32.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: constant.colorShadeRed[1],
                    ),
                    child: Icon(
                      sc.darkMode.value
                          ? Icons.mode_night_rounded
                          : Icons.wb_sunny_rounded,
                      size: 20.w,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  'Dark Mode',
                  style: Theme.of(context).textTheme.headline5,
                ),
                Obx(
                  () => Container(
                    width: 60.w,
                    height: 18.h,
                    padding: EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: sc.darkMode.value
                          ? Color.fromRGBO(61, 213, 152, 1)
                          : Color(0xFF2A3C44),
                    ),
                    child: Row(
                      mainAxisAlignment: sc.darkMode.value
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 30.w,
                          height: 14.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 2,
            color: Color.fromRGBO(150, 167, 175, 1).withOpacity(0.1),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 17.h,
                width: 32.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: constant.colorShadeYellow[1],
                ),
                child: Icon(
                  FontAwesomeIcons.play,
                  size: 17.w,
                  color: Colors.white,
                ),
              ),
              Text(
                'Background play',
                style: Theme.of(context).textTheme.headline5,
              ),
              Container(
                width: 60.w,
                height: 18.h,
                padding: EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Color(0xFF2A3C44),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 30.w,
                      height: 14.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ],
          ),
          Divider(
            thickness: 2,
            color: Color.fromRGBO(150, 167, 175, 1).withOpacity(0.1),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 17.h,
                width: 32.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Color.fromRGBO(61, 213, 152, 1),
                ),
                child: Icon(
                  FontAwesomeIcons.language,
                  size: 17.w,
                  color: Colors.white,
                ),
              ),
              Text(
                'Change Language',
                style: Theme.of(context).textTheme.headline5,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.angleRight,
                  color: Color.fromRGBO(150, 167, 175, 1),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
