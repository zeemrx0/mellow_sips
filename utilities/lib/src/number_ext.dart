import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NumberExt {
  static String withSeparator(num number) {
    NumberFormat formatter =
        NumberFormat.decimalPattern(Get.deviceLocale.toString());
    return formatter.format(number);
  }

  static String vndDisplay(num number) {
    double displayValue = number / 1000;

    if (number % 1000 == 0) {
      return '${displayValue.toInt()}k';
    }
    NumberFormat formatter =
        NumberFormat.decimalPattern(Get.deviceLocale.toString());

    return '${formatter.format(displayValue)}k';
  }
}
