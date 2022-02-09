import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sort_it/constant/constant.dart' as constant;

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 110.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Color.fromRGBO(48, 68, 78, 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 17.h,
                width: 32.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: constant.colorShadeRed[1],
                ),
                child: Icon(
                  FontAwesomeIcons.solidHeart,
                  size: 17.w,
                  color: Colors.white,
                ),
              ),
              Text(
                'Option one',
                style: Theme.of(context).textTheme.headline5,
              ),
              Container(
                width: 60.w,
                height: 18.h,
                padding: EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Color.fromRGBO(61, 213, 152, 1),
                ),
                child: Row(
                  children: [
                    Spacer(),
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
            ],
          ),
          Divider(
            thickness: 2,
            color: Color.fromRGBO(150, 167, 175, 1).withOpacity(0.1),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 17.h,
                width: 32.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: constant.colorShadeYellow[1],
                ),
                child: Icon(
                  FontAwesomeIcons.solidBookmark,
                  size: 17.w,
                  color: Colors.white,
                ),
              ),
              Text(
                'Option one',
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 17.h,
                width: 32.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: constant.colorShadeYellow[1],
                ),
                child: Icon(
                  FontAwesomeIcons.solidBookmark,
                  size: 17.w,
                  color: Colors.white,
                ),
              ),
              Text(
                'Option one',
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
