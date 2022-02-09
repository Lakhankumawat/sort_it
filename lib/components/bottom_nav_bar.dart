import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sort_it/controller/home_controller.dart';

Container CustomBottomNavbar(BuildContext context, HomeController c) {
  Widget BottomNavbarItem(
      {required String text,
      required IconData icon,
      required bool isSelected,
      required int currentIndex}) {
    return GestureDetector(
      onTap: () {
        c.onTappedBar(currentIndex);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Color(0xff3DD598),
                    spreadRadius: 5,
                    blurRadius: 0,
                    //offset: Offset(-1, 5), // changes position of shadow
                  ),
                ]
              : [],
        ),
        padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 2.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              icon,
              color: isSelected ? Colors.white : Color(0xff9796ae),
              size: 25,
            ),
            SizedBox(height: 4),
            Text(
              text,
              style: TextStyle(
                  color: isSelected ? Colors.white : Color(0xff9796ae),
                  fontFamily: 'abzr',
                  fontSize: 11.w,
                  letterSpacing: 0.06,
                  fontWeight: FontWeight.normal,
                  height: 1.2),
            ),
          ],
        ),
      ),
    );
  }

  return Container(
    width: 390,
    height: 80,
    decoration: BoxDecoration(
        color: Color(0xFF30444E),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        )),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              BottomNavbarItem(
                  icon: Icons.home_rounded,
                  text: 'Home',
                  isSelected: c.selectedIndex == 0,
                  currentIndex: 0),
              BottomNavbarItem(
                  icon: Icons.search_rounded,
                  text: 'Discover',
                  isSelected: c.selectedIndex == 1,
                  currentIndex: 1),
              BottomNavbarItem(
                  icon: Icons.map,
                  text: 'Map',
                  isSelected: c.selectedIndex == 2,
                  currentIndex: 0),
              BottomNavbarItem(
                  icon: Icons.account_circle_rounded,
                  text: 'Profile',
                  isSelected: c.selectedIndex == 3,
                  currentIndex: 2),
              BottomNavbarItem(
                  icon: Icons.settings,
                  text: 'Settings',
                  isSelected: c.selectedIndex == 4,
                  currentIndex: 0),
              BottomNavbarItem(
                  icon: Icons.ac_unit,
                  text: 'Coin',
                  isSelected: c.selectedIndex == 4,
                  currentIndex: 0),
            ],
          ),
        ),
        SizedBox(
          height: 7.h,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 6,
            width: 80.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
            ),
          ),
        ),
      ],
    ),
  );
}
