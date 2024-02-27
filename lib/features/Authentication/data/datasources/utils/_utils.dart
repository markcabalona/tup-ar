part of 'package:tup_ar/features/Authentication/data/datasources/auth_remote_datasource_impl.dart';

String toFullName({
  required String firstName,
  String? lastName,
}) {
  return '$firstName\\$lastName';
}
