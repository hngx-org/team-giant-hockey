class SignWithEmailAndPasswordFailure {
  final String message;

  const SignWithEmailAndPasswordFailure([this.message = "An Unknown Error Occurred"]);

  factory SignWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case "invalid-email":
        return const SignWithEmailAndPasswordFailure("Invalid Email Address");
      case "user-disabled":
        return const SignWithEmailAndPasswordFailure("User Disabled");
      case "email-already-in-use":
        return const SignWithEmailAndPasswordFailure("An account already exists for that email address");
      case "weak-password":
        return const SignWithEmailAndPasswordFailure("Please enter a stronger Password");
      case "operation-not-allowed":
        return const SignWithEmailAndPasswordFailure("Operation Not Allowed");
      default:
        return const SignWithEmailAndPasswordFailure();
    }
  }
}