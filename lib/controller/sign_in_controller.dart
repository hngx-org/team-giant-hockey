
import 'package:team_giant_hockey/core/app_export.dart';

import '../services/repository/authentication_repository/authentication_repository.dart';

class SignInController extends GetxController {
  static SignInController get instance => Get.find(); 

  // TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();

  // Call the Function from Design & it will do the rest
    void loginUser(String email, String password) {
      AuthenticationRepository.instance.loginUserWithEmailandPassword(email, password);
    }
 
}
