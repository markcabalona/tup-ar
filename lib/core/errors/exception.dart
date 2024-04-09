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

class ThemeRatingsException implements Exception {
  final String message;
  const ThemeRatingsException({
    required this.message,
  });
}

class EventsPlacesException implements Exception {
  final String message;
  const EventsPlacesException({
    required this.message,
  });
}
