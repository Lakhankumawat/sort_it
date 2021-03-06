import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sort_it/src/screens/home/home.dart';

class Success extends StatelessWidget {
  static String routeName = '/success';
  const Success({Key? key}) : super(key: key);

  void doSomeOperationPush(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushNamed(Home.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    doSomeOperationPush(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(0.6, 0.7),
              end: Alignment(-0.7, 0.6),
              colors: [
                Color.fromRGBO(34, 52, 60, 1),
                Color.fromRGBO(31, 46, 53, 1)
              ]),
        ),
        child: Center(child: Lottie.asset('assets/lottie/success.json')),
      ),
    );
  }
}
