import '../../core/app_export.dart';
import '../../widgets/signin_form_widget.dart';

class SignInScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        title: Text(
          'Sign In To Play',
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
          SignInFormWidget(),
        ],
      ),
    );
  }
}

