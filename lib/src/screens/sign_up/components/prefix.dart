import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class Prefix extends StatelessWidget {
  const Prefix({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CountryCodePicker(
      onChanged: print,
      // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
      initialSelection: 'IN',
      favorite: ['+91', 'IN'],
      // optional. Shows only country name and flag
      showCountryOnly: false,
      // optional. Shows only country name and flag when popup is closed.
      showOnlyCountryWhenClosed: false,
      // optional. aligns the flag and the Text left
      alignLeft: false,
      // Text Style Custom
      textStyle: Theme.of(context).textTheme.headline2,
      boxDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color(0xFF30444E),
      ),
      searchDecoration: InputDecoration(
          fillColor: Color(0xFF30444E),
          //contentPadding: new EdgeInsets.symmetric(vertical: 12),
          border: InputBorder.none,
          hintStyle: Theme.of(context).textTheme.headline4),
    );
  }
}
