class AuthException implements Exception {
  final String message;
  const AuthException({
    required this.message,
  });
}

class FaqsException implements Exception {
  final String message;
  const FaqsException({
    required this.message,
  });
}
