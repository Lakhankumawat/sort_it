import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:sort_it/controller/test_controller.dart';

///---------------------------This Screen is testing screen test all your components and widgets here-----------------///
///----------------------------------------Remove Components After Use-----------------------------------------------///
///-----------------------------Currently Under Test : Screen Util Library-----------------------------------------///
class Test extends StatefulWidget {
  static String routeName = 'test';
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  final TestController t = Get.put(TestController());

  @override
  Widget build(BuildContext context) {
    // printScreenInformation();

    return Scaffold(
      appBar: AppBar(
        title: Text('🧪 Testing Screen..'),
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: [
              const SizedBox(height: 32.0),
              Text('${t.newvar.value}'),
              ElevatedButton(
                onPressed: () {
                  t.updateVal('58');
                },
                child: Text('Getx Testing'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//-----------------Screen Information -------------------//
void printScreenInformation() {
  print('Device width dp:${1.sw}dp');
  print('Device height dp:${1.sh}dp');
  print('Device pixel density:${ScreenUtil().pixelRatio}');
  print('Bottom safe zone distance dp:${ScreenUtil().bottomBarHeight}dp');
  print('Status bar height dp:${ScreenUtil().statusBarHeight}dp');
  print('The ratio of actual width to UI design:${ScreenUtil().scaleWidth}');
  print('The ratio of actual height to UI design:${ScreenUtil().scaleHeight}');
  print('System font scaling:${ScreenUtil().textScaleFactor}');
  print('0.5 times the screen width:${0.5.sw}dp');
  print('0.5 times the screen height:${0.5.sh}dp');
  print('Screen orientation:${ScreenUtil().orientation}');
}
