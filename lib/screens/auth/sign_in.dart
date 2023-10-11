// signin_screen.dart
import '../../controller/sign_in_controller.dart';
import '../../core/app_export.dart';
// Import necessary packages and files

class SignInScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(30),
              height: 300,
              width: double.infinity,
              color: AppTheme.primaryColor,
              child: SizedBox(
                height: 257,
                width: double.infinity,
                child: Image.asset(
                  ImageConstant.game_pad,
                ),
              ),
            ),
            Expanded(
            child: Container(
              color: Colors.black, // Set the background color to black
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Email Field
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(labelText: 'Email'),
                      ),
                    ),
                    // Password Field
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: TextFormField(
                        controller: passwordController,
                        decoration: const InputDecoration(labelText: 'Password'),
                        obscureText: true,
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Sign-up button that calls AuthController's signUp method
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: AppButton(
                        buttonText: 'Sign Up',
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Text('Already have an account?'),
                        Text('Sign In'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          ],
        ),
      ),
    );
  }
}
