import 'package:firebase_auth/firebase_auth.dart';
import 'package:team_giant_hockey/core/app_export.dart';
import 'package:team_giant_hockey/main.dart';

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

  Future<void> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required String fullName}) async {
    print(fullName);
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await userCredential.user!.updateDisplayName(fullName);

      if (_auth.currentUser != null) {
        localStorage.write('email', email);
        localStorage.write('fullName', fullName);
        localStorage.write('userId', _auth.currentUser!.uid);
        Get.snackbar(
          'Sign Up Successful',
          'User registered, kindly log in',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppTheme.primaryColor,
          colorText: AppTheme.whiteColor,
        );
       
        Get.offAll(() => SignInScreen());
        // Save user data to Firestore
      }
      // else {
      // Handle a scenario where the user is not signed in
      Get.offAll(() => SignInScreen());
      // }
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

  Future<void> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final User? user = userCredential.user;
      if (user != null) {
        // Fetch the user's display name
        await user.reload();
        var details = _auth.currentUser;
        String name = details!.displayName.toString();
        localStorage.write("isLoggedIn", true);
        String id = details.uid.toString();
        String userEmail = details.email.toString();
        localStorage.write('email', userEmail);
        localStorage.write('fullName', name);
        localStorage.write('userId', _auth.currentUser!.uid);
        localStorage.write('userId', id);

        Get.snackbar(
          'Sign In Successful',
          'User Signed in',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppTheme.primaryColor,
          colorText: AppTheme.whiteColor,
        );
        // User signed in successfully, navigate to the GameMenuScreen
        Get.offAll(() => const GameMenuScreen());
      }
    } on FirebaseAuthException catch (e) {
      final ex = SignWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      // Show an error message using GetX's snackbar
      Get.snackbar('Authentication Error', ex.message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppTheme.appBackgroundColor,
          colorText: AppTheme.whiteColor);
      throw ex; // Rethrow the exception if needed
    } catch (error) {
      const ex = SignWithEmailAndPasswordFailure();
      print('EXCEPTION - ${ex.message}');
      // Show a generic error message using GetX's snackbar
      Get.snackbar('Authentication Error', ex.message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppTheme.appBackgroundColor,
          colorText: AppTheme.whiteColor);
      throw ex; // Rethrow the exception if needed
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    localStorage.write("isLoggedIn", false);
    Get.snackbar(
      'Sign Out Successful',
      'User Logged out',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppTheme.primaryColor,
      colorText: AppTheme.whiteColor,
    );
    Get.offAll(() => const GameMenuScreen());
  }
}

Future<void> saveUserDataToFirestore(String userId, String email) async {
  try {
    final firestore = FirebaseFirestore.instance;
    final userRef = firestore.collection('users').doc(userId);

    await userRef.set({
      'email': email,
      // Add more user data fields as needed
    });

    print('User data saved to Firestore');
  } catch (error) {
    // Handle Firestore data saving error
    print('Error saving user data to Firestore: $error');
  }
}