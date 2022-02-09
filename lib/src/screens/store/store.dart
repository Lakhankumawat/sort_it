import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:sort_it/components/app_bar.dart';
import 'package:sort_it/controller/store_controller.dart';
import 'package:sort_it/src/screens/store/components/banner.dart';
import 'package:sort_it/src/screens/store/components/cartItem.dart';
import 'package:sort_it/src/screens/store/components/categoryItem.dart';

class Store extends StatelessWidget {
  static String routeName = '/store';

  final StoreController s = Get.put(StoreController());

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
              vertical: 10.h,
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: s.categories.length,
                          itemBuilder: (context, index) {
                            return s.categories[index];
                          }),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: StoreBanner(),
                  ),
                  Flexible(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CartItem(
                          tagline: 'Blue Blazer',
                          price: '\$ 45',
                          image: 'assets/images/cart_item2.png',
                        ),
                        CartItem(
                          tagline: 'Red Blazer',
                          price: '\$ 47',
                          image: 'assets/images/cart_item3.png',
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ));
  }
}
