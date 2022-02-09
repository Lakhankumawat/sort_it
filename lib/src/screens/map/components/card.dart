import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150.h,
      padding: EdgeInsets.symmetric(
        horizontal: 35.w,
        vertical: 15.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.20000000298023224),
              offset: Offset(0, 10),
              blurRadius: 20)
        ],
        color: Color.fromRGBO(31, 46, 53, 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Waste disposal site',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Text(
                    '📍 25, Birnin Kebbi Cres, Garki,\nAbuja • 2km',
                    softWrap: true,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ],
              ),
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/Oval.png'),
                      fit: BoxFit.fitWidth),
                  borderRadius: BorderRadius.all(Radius.elliptical(45, 45)),
                ),
              ),
            ],
          ),
          Text(
            'Routing',
            style: Theme.of(context).textTheme.headline4,
          ),
          Container(
            width: 290,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.16),
                    offset: Offset(0, 5),
                    blurRadius: 10)
              ],
              color: Color(0xffFF575F),
            ),
            child: Center(
              child: Text(
                'Stop',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
