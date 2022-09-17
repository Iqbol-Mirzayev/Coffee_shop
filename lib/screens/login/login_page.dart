import 'package:coffee_shop/core/constants/color_const.dart';
import 'package:coffee_shop/screens/home_page/home_page.dart';
import 'package:coffee_shop/widgets/my_appbar_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../provider/login_provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _firebaseInit = Firebase.initializeApp();
  final FirebaseAuth _authUser = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    debugPrint("Verified  :  ${_authUser.currentUser!.emailVerified}");
    return Scaffold(
        backgroundColor: ColorConst.kScaffoldBackgroundColor,
        appBar: MyAppBar(
          title: "Coffee Shop",
          context: context,
        ),
        body: FutureBuilder(
          future: _firebaseInit,
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("Internet connection is Failed !"),
              );
            } else {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        "assets/lottie/rithm_coffee.json",
                        fit: BoxFit.cover,
                      ),
                      // SizedBox(height: 40),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: "Enter Email",
                          fillColor: Colors.brown,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        // validator: (v)=> v!.length < 5 ? "5 tadan kam bo'lmasin!" : null
                      ),
                      const SizedBox(height: 10.0),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: "Enter Password",
                          fillColor: Colors.brown,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        // validator: (v)=> v!.length < 5 ? "5 tadan kam bo'lmasin!" : null
                      ),
                      ElevatedButton(
                        child: Text("Sign in"),
                        onPressed: () async {
                          await signUp(_emailController.text,
                                  _passwordController.text)
                              .then((value) {
                            if (value != null) {
                              return Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => HomePage(),
                                ),
                              );
                            } else {
                              return ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text("Username already registered !"),
                                ),
                              );
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0))),
                      ),
                      ElevatedButton(
                        child: Text("SIGN IN"),
                        onPressed: () async {
                          await signIn(_emailController.text,
                                  _passwordController.text)
                              .then((value) {
                            if (value) {
                              return Navigator.pushReplacementNamed(
                                  context, "/home");
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Username or password is not correct ",
                                  ),
                                ),
                              );
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.yellow,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0))),
                      ),

                      ElevatedButton(
                         child:  Text("data"),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                        onPressed: () {
                          resetPassword().then((value) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("BUNAQA EMAIL MAVJUD EMAS !"),
                              ),
                            );
                          });
                        },
                      )
                    ],
                  ),
                ),
              );
            }
          },
        ));
  }

  Future<bool?> signUp(String e, String p) async {
    try {
      UserCredential _credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: e, password: p);

      User? _user = _credential.user;
      debugPrint("User : ${_user!.email}");

      return true;
    } catch (e) {
      Text("Errorr  : ====   $e");
      return false;
    }
  }

  Future signIn(String e, String p) async {
    if (_authUser.currentUser == null) {
      try {
        UserCredential? _signedUser =
            await _authUser.signInWithEmailAndPassword(
          email: e,
          password: p,
        );
        return true;
      } catch (e) {
        print("SIGN IN ERROR :  $e");
        return false;
      }
    }
  }

  Future resetPassword() async {
    String email = "iqbolmirzayev2000@gmail.com";
    try {
      await _authUser.sendPasswordResetEmail(email: email);
      debugPrint("EMAIL UCHUN PASSWORD JO'NATILDI !");
      return true;
    } catch (e) {
      debugPrint("RESET PASSWORD ERROR :  $e");
      return false;
    }
  }
}
