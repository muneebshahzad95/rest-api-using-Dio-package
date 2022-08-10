import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:phploginform/screen/loginfoem.dart';
import 'package:phploginform/screen/signupform.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginForm(),
    );
  }
}
