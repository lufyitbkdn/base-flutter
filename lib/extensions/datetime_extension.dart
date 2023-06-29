import 'package:intl/intl.dart';
import 'package:{{PROJECT_NAME}}/core/core.dart';
import 'package:{{PROJECT_NAME}}/extensions/extensions.dart';
import 'package:{{PROJECT_NAME}}/helper/date_helpers.dart';
import 'package:sprintf/sprintf.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

extension DateTimeExtension on DateTime {
  String toUTCDateString() {
    //converts date into the following format:
// or 2019-06-04T12:08:56.235-0700
    return '${DateFormat(serverDateTimeFormat).format(toUtc())}Z';
  }

  String toDateTimeString() {
    //converts date into the following format:
// or 2019-06-04T12:08:56.235-0700
    return '${DateFormat(serverDateTimeFormat).format(this)}Z';
  }

  String toDateString() => DateFormat(serverDateFormat).format(this);

  String toLongDateString() => DateFormat(longDateFormat).format(this);

  String toMediumDateString() => DateFormat(mediumDateFormat).format(this);

  DateTime startOfDate() => DateTime(year, month, day);

  DateTime endOfDate() => DateTime(year, month, day, 23, 59, 59, 999);

  DateTime convertToTimeZone(String? timeZoneLocation) {
    if (timeZoneLocation == null || timeZoneLocation.isEmpty) {
      return this;
    }
    tz.initializeTimeZones();
    final location = tz.getLocation(timeZoneLocation);
    final time =
        tz.TZDateTime.from(this, location).toDateTimeString().dateFromString()!;
    return time;
  }

  DateTime timeZoneToUTC(String? timeZoneLocation) {
    if (timeZoneLocation == null || timeZoneLocation.isEmpty) {
      return this;
    }
    tz.initializeTimeZones();
    final d = toUtc();
    final location = tz.getLocation(timeZoneLocation);
    final time =
        tz.TZDateTime.from(this, location).toDateTimeString().dateFromUTC()!;
    final diff = time.millisecondsSinceEpoch - d.millisecondsSinceEpoch;
    printDebug('convertToLocalTimeZone: $d => $time '
        '=> ${Duration(milliseconds: diff).inHours}');
    return DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch + diff);
  }
}

extension DurationExtension on int {
  String millisecondToFormattedString() {
    final hour = this ~/ 3600000;
    final minute = this ~/ 60000 - hour * 60;
    final second = this ~/ 1000 - this ~/ 60000;
    if (hour > 0) {
      return sprintf('%02i:%02i:%02i', [hour, minute, second]);
    } else {
      return sprintf('%02i:%02i', [minute, second]);
    }
  }
}
