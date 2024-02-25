abstract class ErrorMessageConstants {
  static const serverError =
      "We're sorry! The server has encountered an internal error and was unable to complete your request. Please try again later";

  static const errorCodes = {
    'INVALID_LOGIN_CREDENTIALS': 'Invalid username or password.',
    'USER_NOT_FOUND': 'User not found.',
    'EMAIL_ALREADY_IN_USE':
        'The email address is already in use by another account.',
  };
}
