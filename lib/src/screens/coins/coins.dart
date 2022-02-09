import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sort_it/src/screens/coins/components/bottom_card.dart';

class Coins extends StatelessWidget {
  static String routeName = '/coins';
  const Coins({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 0.1.sw,
            // vertical: 0.1.sh,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Till Today',
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Column(
                  children: [
                    Text(
                      '274',
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 55.w,
                          ),
                    ),
                    Text(
                      ' Total Dumps ',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      FontAwesomeIcons.rupeeSign,
                      color: Colors.white,
                    ),
                    Text(
                      '309.00',
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff19fdfe),
                            fontSize: 80.w,
                          ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  'Keep Dumping',
                  style: Theme.of(context).textTheme.headline5,
                ),
                Row(
                  children: [
                    Container(
                      height: 8.h,
                      width: 8.h,
                      decoration: BoxDecoration(
                        color: Color(0xff19fdfe),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    Container(
                      height: 2.h,
                      width: 0.73.sw,
                      decoration: BoxDecoration(
                        color: Color(0xff19fdfe),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    Container(
                      height: 8.h,
                      width: 8.h,
                      decoration: BoxDecoration(
                        color: Color(0xff19fdfe),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '0',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    Text(
                      '1',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Container(
                  height: 70.h,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 7.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border: Border.all(
                        color: Color.fromRGBO(150, 167, 175, 1), width: 2.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              color: Color.fromRGBO(31, 46, 53, 1),
                              child: Text(
                                'YOU ARE ON',
                                style: Theme.of(context).textTheme.headline4,
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              'LEVEL 1',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff19fdfe),
                                    fontSize: 45.w,
                                  ),
                            ),
                            Text(
                              'Dispose your garbage efficiently and get rewarded regularly',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 15.h,
                        width: 15.h,
                        decoration: BoxDecoration(
                          color: Color(0xff19fdfe),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            FontAwesomeIcons.solidStar,
                            size: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BottomCard(
                      Heading: '2/4',
                      text: 'Daily Rewards',
                    ),
                    BottomCard(
                      Heading: '₹5',
                      text: 'Invite a Friend',
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BottomCard(
                      Heading: '₹327',
                      text: 'Coins',
                    ),
                    BottomCard(
                      Heading: '800',
                      text: 'Dumps',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
