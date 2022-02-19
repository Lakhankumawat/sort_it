import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:sort_it/components/custom_button.dart';
import 'package:sort_it/controller/scan_controller.dart';

class BottomContainer extends StatefulWidget {
  final QRViewController? controller;
  final Barcode? result;
  BottomContainer({Key? key, required this.controller, required this.result})
      : super(key: key);

  @override
  State<BottomContainer> createState() => _BottomContainerState();
}

class _BottomContainerState extends State<BottomContainer> {
  final ScanController sc = Get.find();
  bool campause = false;
  bool showflash = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Color(0xFF30444E),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 50.h,
            padding: EdgeInsets.all(10.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Color.fromRGBO(31, 46, 53, 1),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    child: FutureBuilder(
                      future: widget.controller?.getFlashStatus(),
                      builder: (context, snapshot) {
                        if (snapshot.data != null) {
                          if (snapshot.data! == 'false')
                            return Icon(
                              FontAwesomeIcons.bolt,
                              color: Color(0xff3DD598),
                            );
                          else
                            return SvgPicture.asset(
                              'assets/icons/bolt-slash.svg',
                              color: Color(0xff3DD598),
                            );
                        } else {
                          return Icon(
                            FontAwesomeIcons.infinity,
                          );
                        }
                      },
                    ),
                    onPressed: () async {
                      await widget.controller?.toggleFlash();
                      setState(() {});
                    },
                  ),
                ),
                Expanded(
                  child: TextButton(
                    child: Icon(
                      FontAwesomeIcons.image,
                      color: Color(0xff3DD598),
                    ),
                    onPressed: () {
                      Fluttertoast.showToast(msg: 'Feature Coming Soon');
                    },
                  ),
                ),
                Expanded(
                  child: TextButton(
                    child: FutureBuilder(
                      future: widget.controller?.getCameraInfo(),
                      builder: (context, snapshot) {
                        if (snapshot.data != null) {
                          return Icon(
                            snapshot.data! == 'true'
                                ? FontAwesomeIcons.play
                                : FontAwesomeIcons.pause,
                            color: Color(0xff3DD598),
                          );
                        } else {
                          return Icon(
                            FontAwesomeIcons.infinity,
                          );
                        }
                      },
                    ),
                    onPressed: () async {
                      if (campause) {
                        await widget.controller?.resumeCamera();
                        campause = false;
                      } else {
                        await widget.controller?.pauseCamera();
                        campause = true;
                      }
                      setState(() {});
                    },
                  ),
                ),
                Expanded(
                  child: TextButton(
                    child: FutureBuilder(
                      future: widget.controller?.getCameraInfo(),
                      builder: (context, snapshot) {
                        if (snapshot.data != null) {
                          return Icon(
                            FontAwesomeIcons.camera,
                            color: Color(0xff3DD598),
                          );
                        } else {
                          return Icon(
                            FontAwesomeIcons.infinity,
                          );
                        }
                      },
                    ),
                    onPressed: () async {
                      await widget.controller?.flipCamera();
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.h),
                  child: CustomButton(
                    buttonText: 'Scan Code',
                    textColor: Colors.white,
                    buttonColor: Color.fromRGBO(63, 223, 158, 1),
                    leading: false,
                    onTap: () {
                      print('Data ${widget.result!.code}');
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.h),
                  child: CustomButton(
                    buttonText: 'Enter Code',
                    textColor: Color.fromRGBO(63, 223, 158, 1),
                    buttonColor: Color(0xFF286053),
                    leading: false,
                    onTap: () {},
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
