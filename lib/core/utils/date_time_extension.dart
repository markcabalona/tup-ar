import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  String toFormattedString() {
    return DateFormat('y/M/d - hh:mm a').format(this);
  }
}
