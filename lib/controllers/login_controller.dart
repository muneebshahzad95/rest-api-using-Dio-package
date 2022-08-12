import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'package:phploginform/models/login_model.dart';

class LoginController extends GetxController {
  LoginModel loginModel = LoginModel();
  var response;
  Dio dio = Dio();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<dynamic> loginRecord() async {
    if (emailController.text != "" && passwordController.text != "") {
      FormData formData = FormData.fromMap({
        "email": loginModel.email,
        "password": loginModel.password,
      });
      try {
        /*set the current PC ip*/
        response = await dio.post("http://192.168.1.9/flutter_api/login.php",
            data: formData);
        print("connected with localhost");
        if (response.statusCode == 200) {
          print(response);
          var a = jsonDecode(response.data);
          if (a == 'success') {
            print("welcome");
            Get.toNamed('/home', arguments: true);
          } else {
            print('user not found');
          }
        }
      } catch (e) {
        print(e);
      }
    } else {
      print("user not match");
    }
    return response.data;
  }
}
