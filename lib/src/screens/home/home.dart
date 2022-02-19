import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:sort_it/components/app_bar.dart';
import 'package:sort_it/components/bottom_nav_bar.dart';
import 'package:sort_it/controller/home_controller.dart';
import 'package:sort_it/src/screens/coins/coins.dart';
import 'package:sort_it/src/screens/map/map.dart';
import 'package:sort_it/src/screens/profile/profile.dart';
import 'package:sort_it/src/screens/scan/scan.dart';
import 'package:sort_it/src/screens/settings/settings.dart';
import 'package:sort_it/src/screens/store/store.dart';
import 'package:sort_it/src/screens/test/test.dart';
import '../../../components/app_drawer.dart';
import 'components/body.dart';

class Home extends StatelessWidget {
  static String routeName = '/home';
  Home({Key? key}) : super(key: key);

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: controller.scaffoldKey,
      drawer: AppDrawer(),
      backgroundColor: Color.fromRGBO(31, 46, 53, 1),
      body: Column(
        children: [
          SizedBox(
            height: 15.h,
          ),
          CustomHeader(hc: controller),
          Expanded(
            child: PageView(
              controller: controller.pageController,
              children: <Widget>[
                Body(),
                Store(),
                Test(),
                Profile(),
                Settings(),
                Coins(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavbar(context, controller),
    );
  }
}
