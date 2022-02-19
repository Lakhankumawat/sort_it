import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:sort_it/components/code_field.dart';
import 'package:sort_it/controller/scan_controller.dart';
import 'package:sort_it/src/screens/scan/components/bottom_container.dart';
import 'package:sort_it/src/screens/success/success.dart';
import 'dart:io';

import '../scan.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  ///-------------VARIABLES--------------///
  final ScanController sc = Get.put(ScanController());
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 80.h
        : 120.h;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return Container(
      //height: 0.5.sh,
      padding: EdgeInsets.symmetric(
        horizontal: 0.1.sw,
        vertical: 15.h,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.close(1);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      primary: Color(0xffd6d5d6),
                      //padding: EdgeInsets.all(24),
                    ),
                    child: Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  'Scan QR Code',
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        color: Colors.white,
                      ),
                ),
                Text(
                  'Scan the QR code from garbage provider',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ],
            ),
          ),
          Expanded(
              flex: 5,
              child: QRView(
                key: qrKey,
                onQRViewCreated: onQRViewCreated,
                overlay: QrScannerOverlayShape(
                    borderColor: Color.fromRGBO(31, 46, 53, 1),
                    borderRadius: 10,
                    borderLength: 30,
                    borderWidth: 10,
                    cutOutSize: scanArea),
                onPermissionSet: (ctrl, p) => onPermissionSet(context, ctrl, p),
              )),
          SizedBox(
            height: 10.h,
          ),
          Expanded(
            flex: 3,
            child: BottomContainer(
              controller: controller,
              result: result,
            ),
          ),
        ],
      ),
    );
  }

  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    bool scanned = false;
    controller.scannedDataStream.listen((scanData) {
      if (!scanned) {
        controller.pauseCamera();
        result = scanData;
        print(result!.code);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Success(),
          ),
        ).then((value) => controller.resumeCamera());
      }
    });
  }

  void onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
