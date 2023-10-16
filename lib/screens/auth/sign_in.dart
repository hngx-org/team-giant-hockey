import 'package:team_giant_hockey/widgets/size_config.dart';

import '../../core/app_export.dart';
import '../../widgets/signin_form_widget.dart';

class SignInScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: AppTheme.appBackgroundColor,
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
                scale: 4,
                ImageConstant.game_pad,
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
          SignInFormWidget(),
        ],
      ),
    );
  }
}

class ContainerCurve extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    // path.lineTo(size.width* 0.25, size.height * 0.75);
    path.quadraticBezierTo(
      size.width *0.2,
       size.height * 0.9,
         size.width *0.6,
         size.height * 0.2
         );
    path.lineTo(size.width , 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
