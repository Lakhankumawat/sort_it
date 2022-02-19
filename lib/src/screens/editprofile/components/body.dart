import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:sort_it/components/address_field.dart';
import 'package:sort_it/components/custom_button.dart';
import 'package:sort_it/components/email_field.dart';
import 'package:sort_it/components/name_field.dart';
import 'package:sort_it/components/phone_field.dart';
import 'package:sort_it/controller/editprofile_controller.dart';
import 'package:sort_it/src/screens/editprofile/components/upload.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  final EditProfileController ep = Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    return Container(
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
          vertical: 0.1.sh,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Edit Profile',
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(
                height: 10.h,
              ),
              Upload(),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 10.h,
              ),
              NameField(hint: 'Name', tec: ep.nameController),
              SizedBox(
                height: 10.h,
              ),
              EmailField(hint: 'Email', controller: ep.emailController),
              SizedBox(
                height: 10.h,
              ),
              PhoneField(hint: '98', controller: ep.phoneController),
              SizedBox(
                height: 10.h,
              ),
              AddressField(hint: 'Address', tec: ep.addController),
              SizedBox(
                height: 10.h,
              ),
              CustomButton(
                buttonText: 'Save',
                textColor: Colors.white,
                buttonColor: Color.fromRGBO(63, 223, 158, 1),
                leading: true,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
