import 'app_helpers.dart';
import '../constants/constants.dart';

class AppValidators {
  static String? checkConfirmPassword(
    String? password,
    String? confirmPassword,
  ) {
    if (password == null ||
        confirmPassword == null ||
        confirmPassword.trim().isEmpty) {
      return AppHelpers.getTranslation(TrKeys.cannotBeEmpty);
    }
    if (!arePasswordsTheSame(password, confirmPassword)) {
      return AppHelpers.getTranslation(TrKeys.confirmPasswordIsDifferent);
    }
    return null;
  }

  static String? passwordCheck(String? text) {
    if (text == null || text.trim().isEmpty) {
      return AppHelpers.getTranslation(TrKeys.cannotBeEmpty);
    }
    if (text.length < 6) {
      return AppHelpers.getTranslation(
          TrKeys.passwordShouldContainMinimum6Characters);
    }
    return null;
  }

  static String? emptyCheck(String? text) {
    if (text == null || text.trim().isEmpty) {
      return AppHelpers.getTranslation(TrKeys.cannotBeEmpty);
    }
    return null;
  }

  // static String? emailCheck(String? text) {
  //   if (text == null || text.trim().isEmpty) {
  //     return AppHelpers.getTranslation(TrKeys.cannotBeEmpty);
  //   }
  //         if (!_isValidEmail(text) || !text.contains('@gmail.com') || !text.contains('@mail.ru')) {
  //     return AppHelpers.getTranslation(TrKeys.emailIsNotValid);
  //   }
  //
  //   return null;
  // }

   static String? isValidEmail(String? email) {
    if (email?.isEmpty ?? true) {
      return "Field required";
    }
    final check = RegExp(
      "^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*\$",
    ).hasMatch(email ?? "");
    return check == false ? "Email incorrect" : null;
  }

  static bool isValidPassword(String password) => password.length > 5;

  static bool arePasswordsTheSame(String password, String confirmPassword) =>
      password == confirmPassword;
}
