import 'package:tup_ar/core/utils/app_regex.dart';

abstract class FormValidator {
  static String? nonEmptyValidator(
    String? text, {
    String? errorMessage,
  }) {
    if (text == null || text.isEmpty) {
      return errorMessage ?? 'This field can not be empty.';
    }
    return null;
  }

  static String? passwordValidator(String? text) {
    String errorMessage = '';
    if (text == null || text.isEmpty) {
      return 'Password can not be empty';
    }
    if (text.length < 8) {
      errorMessage += '\t- at least 8 characters\n';
    }
    if (!AppRegex.atLeastOneUpperCase.hasMatch(text)) {
      errorMessage += '\t- at least one uppercase letter\n';
    }
    if (!AppRegex.atLeastOneLowerCase.hasMatch(text)) {
      errorMessage += '\t- at least one lowercase letter\n';
    }
    if (!AppRegex.atleastOneNumeric.hasMatch(text)) {
      errorMessage += '\t- at least one numeric character\n';
    }
    if (!AppRegex.atleastOneSpecialCharacter.hasMatch(text)) {
      errorMessage += '\t- at least one special character\n';
    }

    if (errorMessage.isNotEmpty) {
      return 'Password should contain:\n$errorMessage'.trim();
    }
    return null;
  }

  static String? emailValidator(
    String? text, {
    String? errorMessage,
  }) {
    if (text == null || text.isEmpty) {
      return 'Email can not be empty';
    }
    if (!AppRegex.emailRegex.hasMatch(text)) {
      return 'Please enter a valid email address.';
    }
    return null;
  }
}
