import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:sort_it/controller/sign_up_controller.dart';

class PasswordField extends StatelessWidget {
  PasswordField({Key? key}) : super(key: key);

  SignUpController _controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color(0xFF30444E),
      ),
      height: 60.0,
      child: TextFormField(
        style: Theme.of(context).textTheme.headline3,
        obscureText: true,
        validator: (val) {
          String? msg = _controller.validatePassword(val!);
          if (msg != null) Fluttertoast.showToast(msg: msg);
        },
        onSaved: (val) => _controller.password.value = val!,
        decoration: InputDecoration(
            fillColor: Color(0xFF30444E),
            contentPadding: new EdgeInsets.only(top: 5),
            border: InputBorder.none,
            prefixIcon: Prefix(),
            suffix: Suffix(),
            hintText: '   pass',
            hintStyle: Theme.of(context).textTheme.headline3),
      ),
    );
  }
}

Widget Prefix() {
  return Padding(
    padding: const EdgeInsets.only(right: 8.0),
    child: Container(
      width: 25,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color(0xFF623A42),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Icon(
          FontAwesomeIcons.lock,
          color: Color(0xFFFF575F),
        ),
      ),
    ),
  );
}

Widget Suffix() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: Icon(
      FontAwesomeIcons.solidEyeSlash,
      color: Color(0xFFFF575F),
    ),
  );
}
