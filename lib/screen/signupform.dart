import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  Response? response;
  GlobalKey formKey = GlobalKey();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  // TextEditingController cPass = TextEditingController();

  Future<dynamic> insertrecord() async {
    Dio dio = Dio();
    if (name.text != "" && email.text != "" && pass.text != "") {
      FormData formData = FormData.fromMap({
        "name": name.text,
        "email": email.text,
        "password": pass.text,
      });
      try {
        response = await dio.post(
            "http://192.168.1.10/flutter_api/insert_record.php",
            data: formData);

        if (kDebugMode) {
          print(response);
        }
      } catch (e) {
        print(e);
      }
    } else {
      print("Please Filled All Field");
    }
    return response!.data;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: name,
                decoration: const InputDecoration(
                  label: Text("username"),
                ),
              ),
              TextFormField(
                controller: email,
                decoration: const InputDecoration(
                  label: Text("email"),
                ),
              ),
              TextFormField(
                controller: pass,
                decoration: const InputDecoration(
                  label: Text("password"),
                ),
              ),
              /* TextFormField(
                controller: cPass,
                decoration: InputDecoration(
                  label: Text("Confirm Password"),
                ),
              ),*/
              MaterialButton(
                onPressed: () {
                  insertrecord();
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 35,
                  color: Colors.grey,
                  child: const Text(
                    "Login",
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
