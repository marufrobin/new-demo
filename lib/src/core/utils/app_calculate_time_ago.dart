String calculateTimeAgo({String? inputTimeString, DateTime? inputDateTime}) {
  // Return empty string if both parameters are null
  if (inputTimeString == null && inputDateTime == null) return "";

  DateTime inputTime;

  // Handle String parameter
  if (inputTimeString != null) {
    try {
      inputTime = DateTime.parse(inputTimeString);
    } catch (e) {
      return "invalid date format";
    }
  }
  // Handle DateTime parameter
  else {
    inputTime =
        inputDateTime!; // Safe to use ! as we've checked both aren't null
  }

  DateTime currentTime = DateTime.now();

  Duration difference = currentTime.difference(inputTime);

  // Handle future dates
  if (difference.isNegative) {
    return "in the future";
  }

  // Less than a minute
  if (difference.inSeconds < 60) {
    return difference.inSeconds == 0
        ? "just now"
        : "${difference.inSeconds} ${difference.inSeconds == 1 ? 'sec' : 'secs'}";
  }
  // Less than an hour
  else if (difference.inMinutes < 60) {
    return "${difference.inMinutes} ${difference.inMinutes == 1 ? 'min' : 'min\'s'}";
  }
  // Less than a day
  else if (difference.inHours < 24) {
    return "${difference.inHours} ${difference.inHours == 1 ? 'hr' : 'hrs'}";
  }
  // Less than a week
  else if (difference.inDays < 7) {
    return "${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'}";
  }
  // Less than a month (4 weeks)
  else if (difference.inDays < 30) {
    int weeks = (difference.inDays / 7).floor();
    return "$weeks ${weeks == 1 ? 'week' : 'weeks'}";
  }
  // Less than a year
  else if (difference.inDays < 365) {
    int months = (difference.inDays / 30).floor();
    return "$months ${months == 1 ? 'month' : 'months'}";
  }
  // More than a year
  else {
    int years = (difference.inDays / 365).floor();
    return "$years ${years == 1 ? 'year' : 'years'}";
  }
}
