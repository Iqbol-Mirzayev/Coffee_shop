// import 'package:flutter/material.dart';

// import '../service/firebase/fire_service.dart';

// class RouteProvider extends ChangeNotifier {
//   RouteProvider() {
//     checkLogiPage();
//   }
//   String route = '/login';

//   void checkLogiPage() {
//     if (FireService.auth.currentUser != null) {
//       if (FireService.auth.currentUser!.email == 'ilyosyusufforweb@gmail.com') {
//         FireService.auth.currentUser != null
//             ? route = '/admin'
//             : route = '/login';
//       } else {
//         FireService.auth.currentUser != null
//             ? route = '/home'
//             : route = '/login';
//       }
//     }

//     notifyListeners();
//   }
// }
