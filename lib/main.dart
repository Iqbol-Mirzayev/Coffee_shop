import 'package:coffee_shop/screens/home_page/home_page.dart';
import 'package:coffee_shop/screens/login/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/components/theme_comp.dart';
import 'core/router/router.dart';
import 'provider/route_provider.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  MyRoute _myRoute = MyRoute();

  var user = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coffee',
      theme: ThemeComp.myTheme,
      // initialRoute: "/login",
      // onGenerateRoute: _myRoute.onGenerateRoute,
      home: user != null ? LoginPage() : HomePage(),
    );
  }
}
