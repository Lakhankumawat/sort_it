import 'package:flutter/material.dart';
import 'components/body.dart';

class Scan extends StatelessWidget {
  static String routeName = '/scan';
  const Scan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(31, 46, 53, 1),
      resizeToAvoidBottomInset: false,
      body: Body(),
    );
  }
}
