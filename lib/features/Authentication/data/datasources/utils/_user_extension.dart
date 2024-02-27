part of 'package:tup_ar/features/Authentication/data/datasources/auth_remote_datasource_impl.dart';

extension UserExtension on String {
  ({String firstName, String lastName}) toFirstAndLastName() {
    final fullName = split('\\');

    final firstName = fullName.firstOrNull ?? '';
    final lastName = fullName.length == 1 ? '' : fullName.lastOrNull ?? '';

    return (firstName: firstName, lastName: lastName);
  }
}
