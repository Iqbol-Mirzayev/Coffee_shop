// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import '../service/firebase/fire_service.dart';
// import '../widgets/my_messenger.dart';

// class LoginProvider extends ChangeNotifier {
//   Future signIn(BuildContext context, String emailController,
//       String passwordController, GlobalKey<FormState> formkey) async {
//     try {
//       // if(formkey.currentState!.validate()){
//       UserCredential credential =
//           await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: emailController,
//         password: passwordController,
//       );
//       if (emailController == 'iqbol@gmail.com' &&
//           passwordController == '112233') {
//         Navigator.pushNamedAndRemoveUntil(context, '/admin', (route) => false);
//       } else {
//         Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
//       }
//       // }
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         MyMessenger.messenger(
//             context, "Bunday Emaildagi akkount mavjud emas", Colors.red);
//       } else if (e.code == 'wrong-password') {
//         MyMessenger.messenger(context, "Noto'g'ri parol terildi", Colors.red);
//       }
//     }
//   }

//   // Future signUp(String e, String p) async {
//   //   try {
//   //     UserCredential _credential = await FirebaseAuth.instance
//   //         .createUserWithEmailAndPassword(email: e, password: p);
//   //     User? _user = _credential.user;
//   //   } catch (e) {
//   //     Text("Errorr  $e");
//   //   }
//   // }

//   Future register(
//     BuildContext context,
//     String emailController,
//     String passwordController,
//   ) async {
//     try {
//       UserCredential credential =
//           await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: emailController,
//         password: passwordController,
//       );
//       await FireService.auth.currentUser!.sendEmailVerification();
//       Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         MyMessenger.messenger(context, "Kiritilgan kod juda oddiy", Colors.red);
//       } else if (e.code == 'email-already-in-use') {
//         MyMessenger.messenger(
//             context, "Bu Email bilan oldir ro'yxatdan o'tilgan", Colors.red);
//       }
//     }
//   }

//   Future logOut(BuildContext context) async {
//     try {
//       await FireService.auth.signOut();
//       Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
//     } on FirebaseAuthException catch (e) {
//       print("Xatolik yuz berdi");
//     }
//   }

//   Future forgotPassword(BuildContext context, String emailController) async {
//     await FireService.auth.sendPasswordResetEmail(email: emailController);
//     MyMessenger.messenger(
//         context,
//         'Yangi parol uchun link e-mail pochtanggizga jo\'natildi',
//         Colors.orange);
//   }

//   Future printWhere() async {
//     List where1 = [];
//     var where =
//         await FireService.store.collection('coffee').where('name').get();
//     for (var item in where.docs) {
//       where1.add(item['name']);
//     }
//     debugPrint(where1.toString());
//     notifyListeners();
//   }
// }
