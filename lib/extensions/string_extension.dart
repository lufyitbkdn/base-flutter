import 'package:intl/intl.dart';
import 'package:{{PROJECT_NAME}}/helper/date_helpers.dart';

extension StringExtension on String? {
  String? toCapitalize() {
    if (this == null) return '';
    return '${this![0].toUpperCase()}${this!.substring(1)}';
  }

  DateTime? dateFromUTC() {
    if (this == null || this!.isEmpty) {
      return null;
    } else {
      final format = DateFormat(serverDateTimeFormat);
      return format.parse(this!.replaceAll('Z', ''), true);
    }
  }

  DateTime? dateFromString() {
    if (this == null || this!.isEmpty) {
      return null;
    } else {
      final format = DateFormat(serverDateTimeFormat);
      return format.parse(this!.replaceAll('Z', ''));
    }
  }
}
