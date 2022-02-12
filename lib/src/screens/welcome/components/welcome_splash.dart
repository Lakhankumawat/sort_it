import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sort_it/model/welcome_model.dart';

class WelcomeSplash extends StatelessWidget {
  WelcomeSplash({Key? key, required this.welcomePoster}) : super(key: key);

  WelcomePoster welcomePoster;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Image.asset(
            welcomePoster.image,
            fit: BoxFit.contain,
          ),
        ),
        Text(
          welcomePoster.heading,
          style: Theme.of(context).textTheme.headline1!.copyWith(
                fontSize: 32.w,
                color: Color(0xffBCDDB4),
              ),
        ),
        const SizedBox(height: 10),
        Text(
          welcomePoster.caption,
          style: Theme.of(context).textTheme.headline2,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
