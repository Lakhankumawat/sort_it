import 'package:flutter/material.dart';
import 'components/body.dart';

class EditProfile extends StatelessWidget {
  static String routeName = '/edit-profile';
  EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Body(),
    );
  }
}
