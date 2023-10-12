import 'package:team_giant_hockey/core/app_export.dart';

import '../services/repository/authentication_repository/authentication_repository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find(); 

  // TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();

  // Call the Function from Design & it will do the rest
    void registerUser(String email, String password) {
      AuthenticationRepository.instance.createUserWithEmailandPassword(email, password);
    }



}
