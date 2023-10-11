import '../../core/app_export.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        title: Text(
          'Sign Up To Play',
          style: GoogleFonts.abhayaLibre(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            color: AppTheme.whiteColor,
          ),
        ),
      ),
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
                        controller: emailController,
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
                        controller: passwordController,
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
                        GestureDetector(
                          onTap: () {
                            // Your button's action here
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
        ],
      ),
    );
  }
}
