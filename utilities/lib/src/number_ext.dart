import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NumberExt {
  static String withSeparator(num number) {
    NumberFormat formatter =
        NumberFormat.decimalPattern(Get.deviceLocale.toString());
    return formatter.format(number);
  }
}
