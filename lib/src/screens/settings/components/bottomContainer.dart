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

class BottomContainer extends StatelessWidget {
  BottomContainer({Key? key}) : super(key: key);

  final SettingsController sc = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 160.h,
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.h),
      decoration: BoxDecoration(
        color: Color.fromRGBO(48, 68, 78, 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 17.h,
                width: 32.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: constant.colorShadeRed[1],
                ),
                child: Icon(
                  FontAwesomeIcons.coins,
                  size: 17.w,
                  color: Colors.white,
                ),
              ),
              Text(
                'My Coins',
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
                  FontAwesomeIcons.firstOrder,
                  size: 17.w,
                  color: Colors.white,
                ),
              ),
              Text(
                'My Orders',
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
                  FontAwesomeIcons.store,
                  size: 17.w,
                  color: Colors.white,
                ),
              ),
              Text(
                'Store',
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
                  color: Colors.grey,
                ),
                child: Icon(
                  Icons.feedback,
                  size: 17.w,
                  color: Colors.white,
                ),
              ),
              Text(
                'Feedback',
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
