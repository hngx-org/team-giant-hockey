import 'package:team_giant_hockey/core/app_export.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find(); 

  // TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  // Call the Function from Design & it will do the rest
    void registerUser(String email, String password) {
      
    }

}
