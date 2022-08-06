import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:phploginform/widget/textwidget.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey formKey = GlobalKey();

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future<dynamic> loginRecord() async {
    var response;
    Dio dio = Dio();
    if (email.text != "" && pass.text != "") {
      FormData formData = FormData.fromMap({
        "email": email.text,
        "password": pass.text,
      });
      try {
        /*set the current PC ip*/
        response = await dio.post("http://192.168.1.13/flutter_api/login.php",
            data: formData);
        print("connected with localhost");
        if (response.statusCode == 200) {
          print(response);
          var a = jsonDecode(response.data);
          if (a == 'success') {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  flex: 2,
                  fit: FlexFit.loose,
                  child: Center(
                      child: Image.asset(
                          "assets/images/dotted-world-map-png.png")),
                ),
                Flexible(
                  flex: 2,
                  fit: FlexFit.loose,
                  child: Center(
                      child: Image.asset(
                    "assets/images/iocn (1).png",
                    color: Colors.pink[300],
                  )),
                ),
                Flexible(
                  flex: 2,
                  fit: FlexFit.loose,
                  child: Row(
                    children: [
                      TextWidget("Login", Colors.black, 20.0, FontWeight.bold),
                    ],
                  ),
                ),
                Flexible(
                  flex: 2,
                  fit: FlexFit.loose,
                  child: Card(
                    elevation: 3,
                    shadowColor: Colors.pink,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                        child: TextFormField(
                          controller: email,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: "email"),
                          //  autovalidateMode: AutovalidateMode.onUserInteraction,
                          /*validator: (value) {
                            if (value!.isEmpty) {
                              return 'email';
                            }
                            return null;
                          },*/
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  fit: FlexFit.loose,
                  child: Card(
                    elevation: 3,
                    shadowColor: Colors.pink,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                        child: TextFormField(
                          controller: pass,
                          obscureText: true,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: "Password"),
                          //  autovalidateMode: AutovalidateMode.onUserInteraction,
                          /*validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password';
                            }
                            return null;
                          },*/
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  fit: FlexFit.loose,
                  child: GestureDetector(
                    onTap: () {
                      loginRecord();
                      /*  Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginForm()));*/
                    },
                    child: Card(
                      elevation: 3,
                      shadowColor: Colors.pink,
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Colors.pinkAccent, Colors.orangeAccent]),
                        ),
/*decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10.0),
                        ),*/
                        child: TextWidget(
                            "Sign Up", Colors.white, 16.0, FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
