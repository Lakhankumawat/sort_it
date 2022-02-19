import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CodeField extends StatelessWidget {
  final TextEditingController tec;
  final String hint;
  const CodeField({Key? key, required this.hint, required this.tec})
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
        controller: tec,
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
        color: Color(0xffafd0cb),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: SvgPicture.asset(
          'assets/icons/qr_code.svg',
          color: Color(0xff3DD598),
        ),
      ),
    ),
  );
}
