import 'tr_keys.dart';
import 'app_helpers.dart';

class AppValidators {
  static String? passwordCheck(String? text) {
    if (text == null || text.trim().isEmpty) {
      return AppHelpers.trans(TrKeys.cannotBeEmpty);
    }
    if (text.length < 6) {
      return AppHelpers.trans(TrKeys.passwordShouldContainMinimum6Characters);
    }
    return null;
  }

  static String? emailCheck(String? text) {
    if (text == null || text.trim().isEmpty) {
      return AppHelpers.trans(TrKeys.cannotBeEmpty);
    }
    if (!_isValidEmail(text)) {
      return AppHelpers.trans(TrKeys.emailIsNotValid);
    }
    return null;
  }

  static String? maxQtyCheck(String? max, String? min) {
    if (max == null || max.isEmpty) {
      return AppHelpers.trans(TrKeys.cannotBeEmpty);
    }
    if (min != null) {
      if ((num.tryParse(min) ?? 0) > (num.tryParse(max) ?? 0)) {
        return AppHelpers.trans(TrKeys.maxQtyShouldBeGreaterThanMinQty);
      }
    }
    else if(num.tryParse(max) == null ||
        (num.tryParse(max) ?? 0) < 0 ||
        max.contains('-')) {
      return AppHelpers.trans(TrKeys.cannotBeNegative);
    }
    return null;
  }

  static String? emptyCheck(String? text) {
    if (text == null || text.trim().isEmpty) {
      return AppHelpers.trans(TrKeys.cannotBeEmpty);
    }
    return null;
  }

  static String? priceCheck(String? text) {
    if (text == null || text.trim().isEmpty) {
      return AppHelpers.trans(TrKeys.cannotBeEmpty);
    } else if (num.tryParse(text) == null ||
        (num.tryParse(text) ?? 0) < 0 ||
        text.contains('-')) {
      return AppHelpers.trans(TrKeys.cannotBeNegative);
    }
    return null;
  }

  static bool _isValidEmail(String email) => RegExp(
        "^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*\$",
      ).hasMatch(email);
}
