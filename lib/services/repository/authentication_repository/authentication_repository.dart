import 'package:firebase_auth/firebase_auth.dart';
import 'package:team_giant_hockey/core/app_export.dart';

import '../../../screens/auth/sign_in.dart';
import '../../../screens/games/game_menu.dart';
import 'exceptions/signup_email_password.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // Variables
  final _auth = FirebaseAuth.instance;
  late Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    // if (user == null) {
    //   Get.offAll(() => SignUpScreen());
    // } else {
    //   Get.offAll(() => const GameMenuScreen());
    // }
  }

  Future<void> createUserWithEmailandPassword(
    String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (_auth.currentUser != null) {
        // User signed up successfully, navigate to the GameMenuScreen
        Get.offAll(() => const GameMenuScreen());
      } else {
        // Handle a scenario where the user is not signed in
        Get.offAll(() => SignInScreen());
      }
    } on FirebaseAuthException catch (e) {
      final ex = SignWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      // Show an error message using GetX's snackbar
      Get.snackbar(
        'Authentication Error',
        ex.message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppTheme.appBackgroundColor,
        colorText: AppTheme.whiteColor,
      );
      throw ex; // Rethrow the exception if needed
    } catch (error) {
      const ex = SignWithEmailAndPasswordFailure();
      print('EXCEPTION - ${ex.message}');
      // Show a generic error message using GetX's snackbar
      Get.snackbar(
        'Authentication Error',
        ex.message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppTheme.appBackgroundColor,
        colorText: AppTheme.whiteColor,
      );
      throw ex; // Rethrow the exception if needed
    }
  }
  
  Future<void> loginUserWithEmailandPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      // User signed in successfully, navigate to the GameMenuScreen
      Get.offAll(() => const GameMenuScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      // Show an error message using GetX's snackbar
      Get.snackbar('Authentication Error', ex.message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppTheme.appBackgroundColor,
          colorText: AppTheme.whiteColor
      );
      throw ex; // Rethrow the exception if needed
    } catch (error) {
      const ex = SignWithEmailAndPasswordFailure();
      print('EXCEPTION - ${ex.message}');
      // Show a generic error message using GetX's snackbar
      Get.snackbar('Authentication Error', ex.message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppTheme.appBackgroundColor,
          colorText: AppTheme.whiteColor
      );
      throw ex; // Rethrow the exception if needed
    }
  }

  Future<void> logout() async => await _auth.signOut();
}
