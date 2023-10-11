import '../../core/app_export.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(30),
            height: 300,
            width: double.infinity,
            color: AppTheme.primaryColor,
            child: SizedBox(
              height: 227,
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
                    // Full Name Field
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: TextFormField(
                        controller: fullNameController,
                        decoration:
                            const InputDecoration(labelText: 'Full Name'),
                      ),
                    ),
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
                        decoration:
                            const InputDecoration(labelText: 'Password'),
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account?',
                          style: TextStyle(
                            color: AppTheme.whiteColor,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                              color: AppTheme.primaryColor,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                              side: BorderSide.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
