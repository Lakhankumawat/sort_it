import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sort_it/routes/navigation_route.dart';
import 'package:sort_it/src/screens/home/home.dart';
import 'package:sort_it/src/screens/sign_in/sign_in.dart';
import 'package:sort_it/src/screens/sign_up/sign_up.dart';
import 'package:sort_it/src/screens/welcome/welcome.dart';
import 'constant/constant.dart' as constant;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQueryData.fromWindow(WidgetsBinding.instance!.window),
      child: ScreenUtilInit(
        designSize: Size(500, 500),
        minTextAdapt: true,
        
        splitScreenMode: true,
        builder: () => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Sort It',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: TextTheme(
              button: TextStyle(fontSize: 45.sp),
              headline1: constant.headline1,
              headline2: constant.headline2,
              headline3: constant.headline3,
              headline4: constant.headline4,
              headline5: constant.headline5,
            ),
          ),
          routes: routes,
          initialRoute: Home.routeName,
        ),
      ),
    );
  }
}
