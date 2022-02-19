import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ProfileController extends GetxController {
  //-----------VARIABLES----------//
  final FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData() async {
    Dio dio = Dio();
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));
    try {
      // QueryDocumentSnapshot<Map<String, dynamic>> data =
      //     (await db.collection('users').get()).docs.first;
      // print(jsonEncode(data.data()));
    } catch (e) {
      print(e);
    }
  }
}
