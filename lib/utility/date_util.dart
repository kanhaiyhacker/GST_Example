import 'package:intl/intl.dart';

class DateTimeUtils {
  static String getDate(String time) {
    try {
      String tempDate =
          DateFormat("dd/MM/yyyy").format(DateTime.tryParse(time)!);
      return tempDate;
    } catch (e) {
      return '';
    }
    return "";
  }
}
