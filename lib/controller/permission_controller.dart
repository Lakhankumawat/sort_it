import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sort_it/src/screens/complete/complete_profile.dart';
import 'package:sort_it/src/screens/home/home.dart';

class PermissionController extends GetxController {
  Future<void> getPermission(BuildContext context) async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      // Permission.phone,
      // Permission.sms,
      Permission.camera,
    ].request();
    if (await Permission.location.request().isGranted) {
      print('location granted');
      Fluttertoast.showToast(msg: "Permission Granted!");

      ///Push Named and remove Until Home Screen
      // Navigator.pushNamedAndRemoveUntil(
      //     context, Home.routeName, (route) => false);
      Navigator.of(context).pushNamed(CompleteProfile.routeName);
    } else {
      Fluttertoast.showToast(msg: "Permission Not Granted!");
    }
  }
}
