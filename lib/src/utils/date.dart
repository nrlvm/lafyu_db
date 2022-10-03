class DateUtil {
  static String setDate(DateTime date) {
    String day = date.day.toString();
    String mon = date.month.toString();
    String year = date.year.toString();
    String result = '';
    if (day.length == 1) {
      day = '0$day';
    }
    if (mon.length == 1) {
      mon = '0$mon';
    }
    result = '$day $mon $year';
    return result;
  }
}
