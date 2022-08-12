import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:phploginform/controllers/login_controller.dart';
import 'package:phploginform/screen/loginform.dart';
import '../controllers/singnup_controller.dart';
import '../widget/textwidget.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  SignUpController signUpController = Get.put(SignUpController());
  GlobalKey formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
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
                      TextWidget(" Create your Account", Colors.black, 20.0,
                          FontWeight.bold),
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
                        padding:
                            const EdgeInsets.only(left: 15, right: 15, top: 5),
                        child: TextFormField(
                          controller: signUpController.usernameController,
                          // onChanged: (value) {
                          //   signUpController.usernameController.text = value;
                          // },
                          decoration: const InputDecoration(
                              border: InputBorder.none, hintText: "Username"),
                          // autovalidateMode: AutovalidateMode.onUserInteraction,
                          /* validator: (value) {
                            if (value!.isEmpty) {
                              return 'username';
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
                        padding:
                            const EdgeInsets.only(left: 15, right: 15, top: 5),
                        child: TextFormField(
                          controller: signUpController.emailController,
                          /* onChanged: (value) {
                            signUpController.emailController.text = value;
                          },*/
                          decoration: const InputDecoration(
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
                        padding:
                            const EdgeInsets.only(left: 15, right: 15, top: 5),
                        child: TextFormField(
                          controller: signUpController.passwordController,
                          // onChanged: (value) {
                          //   signUpController.passwordController.text = value;
                          // },
                          obscureText: true,
                          decoration: const InputDecoration(
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
                      signUpController.signUpModel.username =
                          signUpController.usernameController.text.toString();
                      signUpController.signUpModel.email =
                          signUpController.emailController.text.toString();
                      signUpController.signUpModel.password =
                          signUpController.passwordController.text.toString();

                      signUpController.insertrecord();
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

/*class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  SignUpController signUpController = Get.put(SignUpController());

  // Response? response;
  GlobalKey formKey = GlobalKey();
  // TextEditingController name = TextEditingController();
  // TextEditingController email = TextEditingController();
  // TextEditingController pass = TextEditingController();

  // TextEditingController cPass = TextEditingController();

  */ /* Future<dynamic> insertrecord() async {
    Dio dio = Dio();
    if (name.text != "" && email.text != "" && pass.text != "") {
      FormData formData = FormData.fromMap({
        "name": name.text,
        "email": email.text,
        "password": pass.text,
      });
      try {
        */ /* */ /*set the current PC ip*/ /* */ /*
        response = await dio.post(
            "http://192.168.1.13/flutter_api/insert_record.php",
            data: formData);
        print("data inserted");
        if (response!.statusCode == 200) {
          print(response);
        }
      } catch (e) {
        print(e);
      }
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LoginForm()));
    } else {
      print("Please Filled All Field");
    }
    return response!.data;
  }
*/ /*
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
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
                      TextWidget(" Create your Account", Colors.black, 20.0,
                          FontWeight.bold),
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
                        padding:
                            const EdgeInsets.only(left: 15, right: 15, top: 5),
                        child: TextFormField(
                          controller: signUpController.usernameController,
                          decoration: const InputDecoration(
                              border: InputBorder.none, hintText: "Username"),
                          // autovalidateMode: AutovalidateMode.onUserInteraction,
                          */ /* validator: (value) {
                            if (value!.isEmpty) {
                              return 'username';
                            }
                            return null;
                          },*/ /*
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
                        padding:
                            const EdgeInsets.only(left: 15, right: 15, top: 5),
                        child: TextFormField(
                          controller: signUpController.emailController,
                          decoration: const InputDecoration(
                              border: InputBorder.none, hintText: "email"),
                          //  autovalidateMode: AutovalidateMode.onUserInteraction,
                          */ /*validator: (value) {
                            if (value!.isEmpty) {
                              return 'email';
                            }
                            return null;
                          },*/ /*
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
                        padding:
                            const EdgeInsets.only(left: 15, right: 15, top: 5),
                        child: TextFormField(
                          controller: signUpController.passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                              border: InputBorder.none, hintText: "Password"),
                          //  autovalidateMode: AutovalidateMode.onUserInteraction,
                          */ /*validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password';
                            }
                            return null;
                          },*/ /*
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
                      ///---
                      signUpController.insertrecord();
                      */ /*  Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginForm()));*/ /*
                    },
                    child: Card(
                      elevation: 3,
                      shadowColor: Colors.pink,
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Colors.pinkAccent, Colors.orangeAccent]),
                        ),
*/ /*decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10.0),
                        ),*/ /*
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
}*/
