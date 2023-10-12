// import 'package:team_giant_hockey/core/app_export.dart';

// import '../../../screens/auth/sign_in.dart';
// import '../../../screens/games/game_menu.dart';
// import 'exceptions/signup_email_password.dart';

// class AuthenticationRepository extends GetxController {
//   static AuthenticationRepository get instance => Get.find();

//   // Variables
//   final _auth = FirebaseAuth.instance;
//   late Rx<User?> firebaseUser;

//   @override
//   void onReady() {
//     firebaseUser = Rx<User?>(_auth.currentUser);
//     firebaseUser.bindStream(_auth.userChanges());
//     ever(firebaseUser, _setInitialScreen);
//   }

//   _setInitialScreen(User? user) {
//     if (user == null) {
//       Get.offAll(() => SignUpScreen());
//     } else {
//       Get.offAll(() => const GameMenuScreen());
//     }
//   }

//   Future<void> createUserWithEmailandPassword(
//       String email, String password) async {
//     try {
//       await _auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//           firebaseUser.value != null ? Get.offAll(() => const GameMenuScreen()) : Get.offAll(() => SignInScreen());
//     } on FirebaseAuthException catch (e) {
//       final ex = SignWithEmailAndPasswordFailure.code(e.code);
//       print('FIREBASE AUTH EXCEPTION - ${ex.message}');
//       throw ex;
//     } catch (_) {
//       const ex = SignWithEmailAndPasswordFailure();
//       print('EXCEPTION - ${ex.message}');
//     }
//   }

//   Future<void> loginUserWithEmailandPassword(
//       String email, String password) async {
//     try {
//       await _auth.signInWithEmailAndPassword(email: email, password: password);
//     } on FirebaseAuthException catch (e) {
//       // Get.snackbar(
//       //   'Error creating account',
//       //   e.toString(),
//       //   snackPosition: SnackPosition.BOTTOM,
//       // );
//     } catch (_) {}
//   }

//   Future<void> logout() async => await _auth.signOut();
// }
