import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../screen/homescreen.dart';
import '../screen/loginform.dart';
import '../screen/signupform.dart';

final List<GetPage<dynamic>> routes = [
  GetPage(name: '/signup', page: () => SignupScreen()),
  GetPage(name: '/login', page: () => LoginForm()),
  GetPage(name: '/home', page: () => HomeScreen()),
];
