import 'package:flutter/cupertino.dart';
import 'package:sort_it/src/screens/choice/choice.dart';
import 'package:sort_it/src/screens/complete/complete_profile.dart';
import 'package:sort_it/src/screens/editprofile/editprofile.dart';
import 'package:sort_it/src/screens/home/home.dart';
import 'package:sort_it/src/screens/map/map.dart';
import 'package:sort_it/src/screens/permission/permission.dart';
import 'package:sort_it/src/screens/profile/profile.dart';
import 'package:sort_it/src/screens/scan/scan.dart';
import 'package:sort_it/src/screens/settings/settings.dart';
import 'package:sort_it/src/screens/sign_in/sign_in.dart';
import 'package:sort_it/src/screens/sign_up/components/otp.dart';
import 'package:sort_it/src/screens/sign_up/sign_up.dart';
import 'package:sort_it/src/screens/welcome/welcome.dart';
import 'package:sort_it/src/screens/success/success.dart';
import 'package:sort_it/src/screens/test/test.dart';

final Map<String, WidgetBuilder> routes = {
  ///------------------App Flow With Routes -------------------///
  /// | Start - Screen Welcome |
  /// ---------OTP Screen-------
  /// -Subsequent as shown below-
  /// --------------|-----------
  /// | End Screen Test Screen |
  Welcome.routeName: (context) => Welcome(),
  SignIn.routeName: (context) => SignIn(),
  SignUp.routeName: (context) => SignUp(),
  Otp.routeName: (context) => Otp(),
  PermissionsPage.routeName: (context) => PermissionsPage(),
  Choice.routeName: (context) => Choice(),
  CompleteProfile.routeName: (context) => CompleteProfile(),
  Success.routeName: (context) => Success(),
  Home.routeName: (context) => Home(),
  Settings.routeName: (context) => Settings(),
  Scan.routeName: (context) => Scan(),
  MapPreview.routeName: (context) => MapPreview(),
  Profile.routeName: (context) => Profile(),
  EditProfile.routeName: (context) => EditProfile(),
  Test.routeName: (context) => Test(),
};
