import 'package:team_giant_hockey/core/app_export.dart';

import '../services/repository/authentication_repository/authentication_repository.dart';

class SignInController extends GetxController {
  static SignInController get instance => Get.find();

  // TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();

  // Add an `isLoading` variable
  var isLoading = false.obs; // Use GetX observable

  void loginUser(String email, String password) {
    isLoading(true); // Set isLoading to true when the sign-in process starts
    AuthenticationRepository.instance
        .loginUserWithEmailAndPassword(email, password)
        .then((_) {
      // Set isLoading to false when the sign-in process is complete
      isLoading(false);
    });
  }
}
