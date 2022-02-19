import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class EditProfileController extends GetxController {
  //------------------VARIABLES-------------//
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var errormessage = 'An error occured please check your credentials!';
  String userEmail = '';
  String userName = '';
  String userPassword = '';
  var isLogin = false;
  bool showPassword = false;
  final formKey = GlobalKey<FormState>();
  Rx<File>? pickedImage;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addController = TextEditingController();

  ///Set all the controller values for edit profile controller
  void setFields() {}

  void _imgFromCamera() async {
    final imageFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
      maxHeight: 120,
      maxWidth: 120,
    );
    pickedImage!.value = File(imageFile!.path);
  }

  void _imgFromGallery() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
      maxHeight: 120,
      maxWidth: 120,
    );
    pickedImage!.value = File(image!.path);
  }

  Future<bool> trySubmit(BuildContext context) async {
    bool _isValid = formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    // if (pickedImage == null ) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text('Please select an image'),
    //       backgroundColor: Theme.of(context).errorColor,
    //     ),
    //   );
    //   return false;
    // }

    if (_isValid) {
      formKey.currentState!.save();
      return submitAuthForm(
        userEmail.trim(),
        userPassword.trim(),
        userName.trim(),
        isLogin,
        pickedImage!.value,
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
    File? image,
    BuildContext ctx,
  ) async {
    User? currentuser = _auth.currentUser;
    try {
      final ref = FirebaseStorage.instance
          .ref()
          .child('users')
          .child(currentuser!.uid + '.jpg');

      await ref.putFile(image!);

      final url = await ref.getDownloadURL();

      // await FirebaseFirestore.instance
      //     .collection('users')
      //     .doc(currentuser.uid)
      //     .set({
      //   'name': username,
      //   'email': email,
      //   'image_url': url,
      // });

      Fluttertoast.showToast(msg: 'Welcome $username!');
      return true;
    } catch (err) {
      errormessage = err.toString();
      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          content: Text(errormessage),
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

  void showPicker(context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                color: Color(0xFF30444E),
              ),
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(
                        Icons.photo_library,
                        color: Color.fromRGBO(63, 223, 158, 1),
                      ),
                      title: new Text(
                        'Photo Library',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      onTap: () {
                        //_imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(
                      Icons.photo_camera,
                      color: Color.fromRGBO(63, 223, 158, 1),
                    ),
                    title: new Text(
                      'Camera',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    onTap: () {
                      // _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
