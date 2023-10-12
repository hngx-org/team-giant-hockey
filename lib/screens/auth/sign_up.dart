import '../../controller/sign_up_controller.dart';
import '../../core/app_export.dart';
import '../../widgets/signup_form_widget.dart';
import 'sign_in.dart';

class SignUpScreen extends StatelessWidget {
  // final TextEditingController fullNameController = TextEditingController();
  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();

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
          SignUpFormWidget(),
        ],
      ),
    );
  }
}

