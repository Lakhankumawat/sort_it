import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmailField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  const EmailField({Key? key, required this.hint, required this.controller})
      : super(key: key);

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
        controller: controller,
        style: Theme.of(context).textTheme.headline2,
        decoration: InputDecoration(
            fillColor: Color(0xFF30444E),
            contentPadding: new EdgeInsets.symmetric(vertical: 12),
            border: InputBorder.none,
            prefixIcon: Prefix(),
            hintText: hint,
            hintStyle: Theme.of(context).textTheme.headline2),
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
        color: Color.fromRGBO(98, 91, 57, 1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Icon(
          FontAwesomeIcons.envelope,
          color: Color(0xFFFFC542),
        ),
      ),
    ),
  );
}
