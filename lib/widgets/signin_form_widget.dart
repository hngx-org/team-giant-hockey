import '../core/app_export.dart';

class SignInFormWidget extends StatelessWidget {
  const SignInFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInController());
    final _formKey = GlobalKey<FormState>();
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black, // Set the background color to black
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Email Field
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  style: TextStyle(color: AppTheme.whiteColor),
                  controller: controller.email,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: GoogleFonts.abhayaLibre(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      color: AppTheme.whiteColor,
                    ),
                  ),
                ),
              ),
              // Password Field
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  style: TextStyle(color: AppTheme.whiteColor),
                  controller: controller.password,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: GoogleFonts.abhayaLibre(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      color: AppTheme.whiteColor,
                    ),
                  ),
                  obscureText: true,
                ),
              ),
              const SizedBox(height: 30),
              // Sign-up button that calls AuthController's signUp method
              Padding(
                padding: const EdgeInsets.all(8),
                child: AppButton(
                  buttonText: 'Sign In',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      SignInController.instance.loginUser(
                        controller.email.text.trim(),
                        controller.password.text.trim(),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Dont have an account?',
                    style: GoogleFonts.abhayaLibre(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      color: AppTheme.whiteColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        ),
                      );
                    },
                    child: Ink(
                      decoration: const BoxDecoration(
                        color: AppTheme.primaryColor,
                      ),
                      child: Container(
                        // constraints: const BoxConstraints(
                        //   maxWidth: 200.0, // Set a maximum width
                        // ),
                        alignment: Alignment.center,
                        padding:
                            const EdgeInsets.all(8.0), // Add padding as needed
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: AppTheme.primaryColor, // Text color
                            fontSize: 18.0, // Text size
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
