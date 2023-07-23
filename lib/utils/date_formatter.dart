import 'dart:developer';

import 'package:intl/intl.dart';

///Convert Dates in any format you wish, write the function first
class DateFormatter {
  static String getFormattedDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  static String formatDateTime(String dateTime) {
    try {
      return DateFormat.yMMMd().add_jm().format(DateTime.parse(dateTime));
    } catch (e) {
      log("DateFormatter:$e");
      return dateTime;
    }
  }

  static DateTime? getDateTimeObject(String? dateTime) {
    try {
      return DateTime.parse(dateTime ?? "");
    } catch (e) {
      log("DateFormatter: $e");
      return null;
    }
  }
}
