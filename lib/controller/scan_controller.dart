import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanController extends GetxController {
  late Rx<Barcode?> result;
  late Rx<QRViewController?> controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  RxBool campause = false.obs;
  RxBool showCodeState = false.obs;
  final TextEditingController codeController = TextEditingController();

  // @override
  // void onInit() {
  //   onQRViewCreated;
  //   super.onInit();
  // }

  void enterCode({required bool newval}) {
    showCodeState.value = newval;
  }

  void onQRViewCreated(QRViewController newval) {
    controller.value = newval;

    controller.value!.scannedDataStream.listen((scanData) {
      result.value = scanData;
    });

    // print(
    //     'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}');
  }

  void onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  ///-------------Toggle Flash------------///
  void toggleFlash({required QRViewController? controller}) async {
    await controller?.toggleFlash();
  }

  ///--------------Toggle Camera----------///
  void toggleCamera({required QRViewController? controller}) async {
    await controller?.flipCamera();
  }

  ///--------------Pause Camera----------///
  void pauseCamera({required QRViewController? controller}) async {
    await controller?.pauseCamera();
    campause.value = true;
  }

  ///--------------Resume Camera----------///
  void resumeCamera({required QRViewController? controller}) async {
    await controller?.resumeCamera();
    campause.value = false;
  }
}
