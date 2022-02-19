import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:sort_it/controller/editprofile_controller.dart';
import 'dart:io';

class Upload extends StatelessWidget {
  Upload({Key? key}) : super(key: key);

  final EditProfileController ep = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ep.showPicker(context);
      },
      child: ep.pickedImage == null
          ? Container(
              decoration: BoxDecoration(
                color: Color(0xFF30444E),
                borderRadius: BorderRadius.all(Radius.elliptical(80, 80)),
              ),
              width: 55.h,
              height: 55.h,
              child: Icon(
                Icons.camera_alt,
                size: 20.h,
                color: Color.fromRGBO(150, 167, 175, 1),
              ),
            )
          : CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xFF30444E),
              backgroundImage: FileImage(ep.pickedImage as File),
            ),
    );
  }
}
