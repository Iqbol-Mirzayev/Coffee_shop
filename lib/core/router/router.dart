import 'package:coffee_shop/screens/home_page/home_page.dart';
import 'package:coffee_shop/screens/login/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyRoute {
  Route? onGenerateRoute(RouteSettings settings) {
    var args = settings.arguments;

    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: ((context) =>  LoginPage()));
      case '/home':
        return MaterialPageRoute(builder: ((context) => HomePage()));
      // case '/admin':
      //   return MaterialPageRoute(builder: ((context) => AdminPage()));
    }
  }
}
