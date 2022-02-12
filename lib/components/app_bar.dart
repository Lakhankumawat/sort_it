import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sort_it/controller/home_controller.dart';

class CustomHeader extends StatelessWidget {
  final HomeController hc;
  const CustomHeader({Key? key, required this.hc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 0.1.sw,
        //vertical: 0.05.sh,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              hc.scaffoldKey.currentState!.openDrawer();
            },
            icon: Icon(
              FontAwesomeIcons.bars,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.shoppingCart,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
