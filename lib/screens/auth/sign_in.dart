// signin_screen.dart
import '../../controller/sign_in_controller.dart';
import '../../core/app_export.dart';
import 'package:flutter/material.dart';
// Import necessary packages and files

class SignInScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            // Email Field
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            // Password Field
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            // Sign-in button that calls AuthController's signIn method
            ElevatedButton(
              onPressed: () {
                // final email = emailController.text;
                // final password = passwordController.text;
                // Get.find<AuthController>().signIn(email, password);
              },
              child: Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
