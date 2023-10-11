// // import 'package:flutter/material.dart';
// // auth_controller.dart
// import 'package:get/get.dart';
// import '../../core/app_export.dart';

// class AuthController extends GetxController {
//   // Implement authentication methods using Firebase here

//   Future<void> signUp(String fullName, String email, String password) async {
//   try {
//     final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
//       email: email,
//       password: password,
//     );

//     // Update the user's display name with the full name
//     await userCredential.user!.updateDisplayName(fullName);

//     // Handle successful sign-up (e.g., navigate to the home screen)
//   } catch (e) {
//     // Handle sign-up error
//   }
// }

// }
