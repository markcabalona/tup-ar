abstract class AppRegex {
  static final atLeastOneLowerCase = RegExp(r'[a-z]+');
  static final atLeastOneUpperCase = RegExp(r'[A-Z]+');
  static final atleastOneNumeric = RegExp(r'[0-9]+');
  static final atleastOneSpecialCharacter = RegExp(r'[!@#\$&*~]+');

  static final emailRegex = RegExp(
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$",
  );
}
