import 'package:flutter/material.dart';
import 'components/body.dart';

class CompleteProfile extends StatelessWidget {
  static String routeName = '/complete-profile';
  CompleteProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Body(),
    );
  }
}
