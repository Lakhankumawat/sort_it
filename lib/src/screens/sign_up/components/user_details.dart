import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sort_it/components/custom_button.dart';
import 'package:sort_it/src/screens/sign_up/components/email_field.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 0.1.sw,
        vertical: 0.1.sh,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(12),
            //   boxShadow: [
            //     BoxShadow(
            //         color: Color.fromRGBO(15, 218, 136, 0.3),
            //         offset: Offset(0, 2),
            //         blurRadius: 4)
            //   ],
            //   gradient: LinearGradient(
            //       begin: Alignment(0, 1),
            //       end: Alignment(-1, 0),
            //       colors: [
            //         Color.fromRGBO(63, 223, 158, 1),
            //         Color.fromRGBO(62, 213, 152, 1)
            //       ]),
            // )
            child: Image.asset('assets/images/logo.png'),
          ),
          Text(
            'Hello',
            style: Theme.of(context).textTheme.headline1,
          ),
          Text(
            'lets introduce',
            style: Theme.of(context).textTheme.headline2,
          ),
          EmailField(
            hint: 'Your name',
          ),
          EmailField(
            hint: 'Your email',
          ),
          Row(
            children: [
              Flexible(
                flex: 1,
                child: CustomButton(
                  buttonText: '',
                  textColor: Color.fromRGBO(63, 223, 158, 1),
                  buttonColor: Color(0xFF286053),
                  leading: false,
                  onTap: () {},
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Flexible(
                flex: 4,
                child: CustomButton(
                  buttonText: 'Next',
                  textColor: Colors.white,
                  buttonColor: Color.fromRGBO(63, 223, 158, 1),
                  leading: true,
                  onTap: () {},
                ),
              ),
            ],
          ),
          SizedBox(
            width: 0.4.sh,
          ),
        ],
      ),
    );
  }
}
