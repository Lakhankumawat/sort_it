import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:sort_it/components/custom_button.dart';
import 'package:sort_it/components/email_field.dart';
import 'package:sort_it/components/name_field.dart';
import 'package:sort_it/controller/complete_controller.dart';

class UserDetails extends StatelessWidget {
  UserDetails({Key? key}) : super(key: key);

  final CompleteProfileController cp = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hello',
          style: Theme.of(context).textTheme.headline1,
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          'lets introduce',
          style: Theme.of(context).textTheme.headline2,
        ),
        SizedBox(
          height: 20.h,
        ),
        NameField(
          hint: 'Your name',
          tec: cp.nameController,
        ),
        SizedBox(
          height: 10.h,
        ),
        EmailField(
          hint: 'Your email',
          controller: cp.emailController,
        ),
      ],
    );
  }
}
