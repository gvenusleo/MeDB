String dateTimeToString(String dateTime) {
  return dateTime.substring(0, 16).replaceAll('-', '/');
}
