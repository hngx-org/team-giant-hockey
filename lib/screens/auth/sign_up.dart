// signup_screen.dart
import '../../core/app_export.dart';
import 'package:flutter/material.dart';
// Import necessary packages and files

class SignUpScreen extends StatelessWidget {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            // Full Name Field
            TextFormField(
              controller: fullNameController,
              decoration: InputDecoration(labelText: 'Full Name'),
            ),
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
            // Sign-up button that calls AuthController's signUp method
            ElevatedButton(
              onPressed: () {
                // final fullName = fullNameController.text;
                // final email = emailController.text;
                // final password = passwordController.text;
                // Get.find<AuthController>().signUp(fullName, email, password);
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
