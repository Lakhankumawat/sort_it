import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sort_it/components/custom_button.dart';
import 'package:sort_it/components/email_field.dart';
import 'package:sort_it/components/password_field.dart';

class PasswordDetails extends StatelessWidget {
  const PasswordDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
          'User Name',
          style: Theme.of(context).textTheme.headline2,
        ),
        SizedBox(
          height: 20.h,
        ),
        PasswordField(hinttext: 'Create password'),
        SizedBox(
          height: 10.h,
        ),
        PasswordField(hinttext: 'Retype your password'),
      ],
    );
  }
}
