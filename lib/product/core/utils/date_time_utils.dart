import 'package:intl/intl.dart';
import 'package:myapp/product/core/constants/app_constants.dart'; // For date and time formatting

class DateTimeUtils {
  static String getFormattedDateTime() {
    final now = DateTime.now();
    final date =
        DateFormat(AppStrings.dateFormat, AppStrings.locale).format(now);
    final time =
        DateFormat(AppStrings.timeFormat, AppStrings.locale).format(now);
    return '$date $time';
  }
}
