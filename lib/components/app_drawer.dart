import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFF475E69),
      child: buildMenu(context),
    );
  }

  Widget buildMenu(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 10.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xFF96A7AF),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: EdgeInsets.only(
                  left: 10.h,
                  right: 10.h,
                  top: 0.1.sh,
                  bottom: 30.h,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sort It User',
                          style:
                              Theme.of(context).textTheme.headline2!.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Icon(
                          FontAwesomeIcons.solidCheckCircle,
                          size: 15,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    Text(
                      'A15, WePeople, Street L1, NY',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    QrImage(
                      data: 'This QR code has an embedded image as well',
                      version: QrVersions.auto,
                      foregroundColor: Colors.white,
                      size: 80.h,
                      gapless: false,
                      embeddedImageStyle: QrEmbeddedImageStyle(
                        size: Size(80, 80),
                      ),
                    ),
                    Text(
                      'Scan this code',
                      style: Theme.of(context).textTheme.headline2!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 50.h,
                top: -20.h,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 50.0.w,
                  child: Image.asset('assets/images/user.png'),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.home, size: 20.0, color: Colors.white),
            title: const Text("Home"),
            textColor: Colors.white,
            dense: true,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.verified_user,
                size: 20.0, color: Colors.white),
            title: const Text("Profile"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.monetization_on,
                size: 20.0, color: Colors.white),
            title: const Text("Wallet"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.shopping_cart,
                size: 20.0, color: Colors.white),
            title: const Text("Cart"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {},
            leading:
                const Icon(Icons.star_border, size: 20.0, color: Colors.white),
            title: const Text("Favorites"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {},
            leading:
                const Icon(Icons.settings, size: 20.0, color: Colors.white),
            title: const Text("Settings"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }
}
