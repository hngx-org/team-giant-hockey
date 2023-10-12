import '../controller/sign_up_controller.dart';
import '../core/app_export.dart';
import '../screens/auth/sign_in.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();
    return Form(
      key: _formKey,
      child: Expanded(
        child: Container(
          color: Colors.black, // Set the background color to black
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Full Name Field
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    style: TextStyle(color: AppTheme.whiteColor),
                    controller: controller.fullName,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      labelStyle: GoogleFonts.abhayaLibre(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        color: AppTheme.whiteColor,
                      ),
                    ),
                  ),
                ),
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
                    buttonText: 'Sign Up',
                    onPressed: () {
                      if(_formKey.currentState!.validate()){
                        SignUpController.instance.registerUser(
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
                      'Already have an account?',
                      style:GoogleFonts.abhayaLibre(
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
                              builder: (context) => SignInScreen()),
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
                          padding: const EdgeInsets.all(
                              8.0), // Add padding as needed
                          child: const Text(
                            'Sign In',
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
      ),
    );
  }
}
