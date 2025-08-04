// convertir un objeto de tipo datetime a una cadena yyyymmdd
String convertirDateTimeACadena(DateTime dateTime) {
  // año en el formato -> yyyy
  String year = dateTime.year.toString();

  // mes en el formato -> mm
  String month = dateTime.month.toString();
  if (month.length == 1) {
    month = '0$month';
  }

  // dia en el formato -> dd
  String day = dateTime.day.toString();
  if (day.length == 1) {
    month = '0$day';
  }

  // formato final -> yyyymmdd
  String yyyymmdd = year + month + day;

  return yyyymmdd;
}
