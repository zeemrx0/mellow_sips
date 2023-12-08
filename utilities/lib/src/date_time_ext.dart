import 'package:intl/intl.dart';

class DateTimeExt {
  const DateTimeExt._();

  static const int weekStartDay = DateTime.saturday;

  static const String ddMMyyyy = 'dd/MM/yyy';
  static const String ddMMyyyyHHmm = 'dd/MM/yyy';
  static const String hm = 'HH:mm';

  static String displayDate(
      {required DateTime? dateTime, String pattern = ddMMyyyy}) {
    return dateTime != null
        ? DateFormat(pattern).format(dateTime)
        : '--/--/----';
  }

  static String displayTime(
      {required DateTime? dateTime, String pattern = hm}) {
    return dateTime != null ? DateFormat(pattern).format(dateTime) : '--:--';
  }

  static String displayDateTime(
      {required DateTime? dateTime, String pattern = ddMMyyyyHHmm}) {
    return dateTime != null
        ? DateFormat(pattern).format(dateTime)
        : '--/--/---- --:--';
  }
}
