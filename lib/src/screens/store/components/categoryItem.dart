import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  final String subtitle;
  final String icon;
  final bool isselected;
  const CategoryItem(
      {Key? key,
      required this.subtitle,
      required this.icon,
      required this.isselected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: 81,
          height: 146,
          padding: EdgeInsets.symmetric(vertical: 5.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.5),
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(25, 40, 47, 1),
                  offset: Offset(0, 1),
                  blurRadius: 14)
            ],
            color:
                isselected ? Color.fromRGBO(255, 86, 94, 1) : Color(0xFF30444E),
          ),
          child: Column(
            children: [
              Container(
                width: 66,
                height: 66,
                decoration: BoxDecoration(
                  color: isselected
                      ? Color.fromRGBO(255, 86, 94, 1)
                      : Color(0xFF30444E),
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: isselected
                        ? Color.fromRGBO(255, 255, 255, 1)
                        : Color(0xFF475E69),
                  ),
                ),
                child: Center(
                    child: Text(
                  icon,
                  style: Theme.of(context).textTheme.headline1,
                )),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                subtitle,
                style: isselected
                    ? Theme.of(context).textTheme.headline5
                    : Theme.of(context).textTheme.headline4,
              ),
            ],
          )),
    );
  }
}
