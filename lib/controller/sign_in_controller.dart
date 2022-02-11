import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  //------------------VARIABLES-------------//
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var error = 'An error occured please check your credentials!';
  String userEmail = '';
  String userName = '';
  String userPassword = '';
  var isLogin = false;
  bool showPassword = false;
  final formKey = GlobalKey<FormState>();
  File? userImgfile;

  void pickImage(File? image) {
    userImgfile = image;
  }

  changePasswordVisibility() {
    showPassword = !showPassword;
  }

  changeLoginType() {
    isLogin = !isLogin;
  }

  Future<bool> trySubmit(BuildContext context) async {
    bool _isValid = formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (userImgfile == null && !isLogin) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select an image'),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
      return false;
    }

    if (_isValid) {
      formKey.currentState!.save();
      return submitAuthForm(
        userEmail.trim(),
        userPassword.trim(),
        userName.trim(),
        isLogin,
        context,
      );
    }
    return false;
  }

  Future<bool> submitAuthForm(
    String email,
    String password,
    String username,
    bool isLogin,
    BuildContext ctx,
  ) async {
    UserCredential currentuser;
    try {
      if (isLogin) {
        currentuser = await _auth.signInWithEmailAndPassword(
            email: email, password: password);

        Fluttertoast.showToast(msg: 'Welcome back !');
        return true;
      } else {
        currentuser = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        // final ref = FirebaseStorage.instance
        //     .ref()
        //     .child('user_images')
        //     .child(currentuser.user!.uid + '.jpg');
        //
        // await ref.putFile(image!);

        //final url = await ref.getDownloadURL();

        await FirebaseFirestore.instance
            .collection('users')
            .doc(currentuser.user!.uid)
            .set({
          'name': username,
          'email': email,
          'image_url': null,
        });

        Fluttertoast.showToast(msg: 'Welcome $username!');
        return true;
      }
    } catch (err) {
      error = err.toString();
      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          content: Text(error),
          action: SnackBarAction(
            onPressed: () {},
            label: 'undo',
          ),
          backgroundColor: Colors.black,
        ),
      );
      return false;
    }
  }
}
