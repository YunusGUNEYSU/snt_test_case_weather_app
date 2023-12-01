import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get dayTime => DateFormat.EEEE().format(this);
}
