import 'package:team_giant_hockey/core/app_export.dart';

import '../services/repository/authentication_repository/authentication_repository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();
  var isLoading = false.obs;

  // TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();

  // Call the Function from Design & it will do the rest
  void registerUser({required String email,required String password, required String fullName }) {
    isLoading(true);
    AuthenticationRepository.instance.createUserWithEmailAndPassword(
        email: email, password: password, fullName: fullName)..then((_) {
      // Set isLoading to false when the sign-in process is complete
      isLoading(false);
    });
  }
}
