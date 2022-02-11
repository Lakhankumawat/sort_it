import 'package:flutter/material.dart';
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
          style: TextStyle(
            color: Color(0xffBCDDB4),
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          welcomePoster.caption,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
