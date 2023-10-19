import 'package:team_giant_hockey/widgets/size_config.dart';
import '../../core/app_export.dart';
import '../../widgets/signup_form_widget.dart';

class SignUpScreen extends StatelessWidget {
  // final TextEditingController fullNameController = TextEditingController();
  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();

  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: AppTheme.appBackgroundColor
      ,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
            height: getProportionateScreenHeight(314),
            width: double.infinity,
            color: AppTheme.primaryColor,
            child: SizedBox(
              height: 227,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(35),
                  ),
                  Text(
                    'Sign Up\nTo Play',
                    style: GoogleFonts.abhayaLibre(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      color: AppTheme.whiteColor,
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      height: getProportionateScreenHeight(169),
                      width: getProportionateScreenWidth(257),
                      child: Image.asset(
                        ImageConstant.game_pad,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
           ClipPath(
            clipper: ContainerCurve(),
            child: Container(
              height: getProportionateScreenHeight(100),
              width: double.infinity,
              color: AppTheme.primaryColor,
            ),
          ),
          SignUpFormWidget(),
        ],
      ),
    );
  }
}
