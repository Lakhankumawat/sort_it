import 'package:flutter/cupertino.dart';
import 'package:sort_it/src/screens/home/home.dart';
import 'package:sort_it/src/screens/map/map.dart';
import 'package:sort_it/src/screens/profile/profile.dart';
import 'package:sort_it/src/screens/settings/settings.dart';
import 'package:sort_it/src/screens/sign_in/sign_in.dart';
import 'package:sort_it/src/screens/sign_up/sign_up.dart';
import 'package:sort_it/src/screens/welcome/welcome.dart';
import 'package:sort_it/src/screens/success/success.dart';
import 'package:sort_it/src/screens/test/test.dart';

final Map<String, WidgetBuilder> routes = {
  Home.routeName: (context) => Home(),
  SignIn.routeName: (context) => SignIn(),
  SignUp.routeName: (context) => SignUp(),
  Settings.routeName: (context) => Settings(),
  MapPreview.routeName: (context) => MapPreview(),
  Profile.routeName: (context) => Profile(),
  Success.routeName: (context) => Success(),
  Test.routeName: (context) => Test(),
  Welcome.routeName: (context) => Welcome(),
};
