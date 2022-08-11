import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'package:phploginform/models/signup_model.dart';
import 'package:phploginform/screen/loginform.dart';

class SignUpController extends GetxController {
  var response;
  Dio dio = Dio();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  SignUpModel signUpModel = SignUpModel();

  Future<dynamic> insertrecord() async {
    Dio dio = Dio();
    if (usernameController.text != "" &&
        emailController.text != "" &&
        passwordController.text != "") {
      try {
        /* FormData formData = FormData.fromMap({
          "username": usernameController.text,
          "email": emailController.text,
          "password": passwordController.text,
        });*/

        ///through model object...
        FormData formData = FormData.fromMap({
          "username": signUpModel.username,
          "email": signUpModel.email,
          "password": signUpModel.password,
        });
        /*set the current PC ip*/
        response = await dio.post(
            "http://192.168.1.9/flutter_api/insert_record.php",
            data: formData);
        print("data inserted");
        if (response!.statusCode == 200) {
          print(response);
        }
      } catch (e) {
        print(e);
      }
      //Get.to(() => LoginForm());
    } else {
      print("Please Filled All Field");
    }
    return response.data;
  }
}
