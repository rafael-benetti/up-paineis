import 'package:flutter/material.dart';
import 'package:uppaineis/screens/home_page.dart';
import 'package:uppaineis/screens/home_screen.dart';
import 'package:uppaineis/screens/login_page_3/login_page_3_screen.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => HomeScreen(),
  LoginPage3Screen.routeName: (context) => LoginPage3Screen(),
  HomePage.routeName: (context) => HomePage(),
};
