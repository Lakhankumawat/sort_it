import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.25.sh,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(
            'assets/images/yellow_card.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            FontAwesomeIcons.gift,
            color: Colors.white,
          ),
          Text(
            'Weekly progress',
            style:
                Theme.of(context).textTheme.headline1!.copyWith(fontSize: 26.w),
          ),
          Text(
            'It looks like you are on track. Please continue to follow your daily plan',
            textAlign: TextAlign.center,
            style:
                Theme.of(context).textTheme.headline1!.copyWith(fontSize: 25.w),
          ),
        ],
      ),
    );
  }
}
