import '../core/app_export.dart';

class SignInFormWidget extends StatefulWidget {
  const SignInFormWidget({
    super.key,
  });

  @override
  State<SignInFormWidget> createState() => _SignInFormWidgetState();
}

class _SignInFormWidgetState extends State<SignInFormWidget> {
  final controller = Get.put(SignInController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Expanded(
        child: Obx(() {
          return controller.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(), // Show a loading indicator
                )
              : Container(
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
                                padding: const EdgeInsets.all(
                                    8.0), // Add padding as needed
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
                );
        }),
      ),
    );
  }
}

class CustomLoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 80, // Adjust the width as needed
          height: 4, // Adjust the height as needed
          decoration: BoxDecoration(
            color: Colors.blue, // Color of the loading indicator
            border: Border.all(
              color: Colors.blue, // Border color
              width: 2, // Border width
            ),
            borderRadius: BorderRadius.circular(10), // Adjust the border radius as needed
          ),
        ),
        SizedBox(height: 10), // Adjust the spacing as needed
        Text(
          'Loading...',
          style: TextStyle(color: Colors.blue, fontSize: 16),
        ),
      ],
    );
  }
}
