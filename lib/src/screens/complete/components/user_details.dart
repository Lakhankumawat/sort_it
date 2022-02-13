import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sort_it/components/custom_button.dart';
import 'package:sort_it/src/screens/sign_up/components/email_field.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({Key? key}) : super(key: key);

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
        EmailField(
          hint: 'Your name',
        ),
        SizedBox(
          height: 10.h,
        ),
        EmailField(
          hint: 'Your email',
        ),
      ],
    );
  }
}
