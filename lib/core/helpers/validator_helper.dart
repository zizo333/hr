import '../utils/app_strings.dart';

class ValidatorHelper {
  const ValidatorHelper._();

  static String? validateText(String? text, String errorMessage) {
    if (text!.isEmpty) {
      return errorMessage;
    }
    return null;
  }

  static String? validatePhone(String? phone) {
    if (phone!.isEmpty) {
      return AppStrings.phoneNumberIsRequired;
    } else if (phone.isNotEmpty && phone.length != 10) {
      return AppStrings.phoneNumberIsInvalid;
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password!.isEmpty) {
      return AppStrings.passwordIsRequired;
    } else if (password.length < 8) {
      return AppStrings.shortPassword;
    }
    return null;
  }
}
