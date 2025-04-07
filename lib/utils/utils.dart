String getDateSubtitle(DateTime? dateTime) {
  if (dateTime == null) {
    return 'Select a date and time';
  } else {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute}';
  }
}

String getPassengersSubtitle(int passengers) {
  if (passengers == 1) {
    return '1 Passenger';
  } else {
    return '$passengers Passengers';
  }
}
