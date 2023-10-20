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
        return const SignWithEmailAndPasswordFailure("Please enter a stronger password (at least 8 characters with a mix of letters, numbers, and special characters).");
      case "operation-not-allowed":
        return const SignWithEmailAndPasswordFailure("Operation Not Allowed");
      case "user-not-found":
        return const SignWithEmailAndPasswordFailure("User not found. Please double-check your email address.");
      case "wrong-password":
        return const SignWithEmailAndPasswordFailure("Incorrect password. Please double-check your password.");
      default:
        return const SignWithEmailAndPasswordFailure();
    }
  }
}
