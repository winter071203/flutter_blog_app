  String convertDate(String date) {
    return '${DateTime.parse(date).hour.toString()}:${DateTime.parse(date).minute.toString()} ${DateTime.parse(date).day.toString()}/${DateTime.parse(date).month.toString()}/${DateTime.parse(date).year.toString()}';
  }