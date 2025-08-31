extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
  String toRemoveUnderscore() => replaceAll("_", " ");
}

String? extractLastNumber(String input) {
  RegExp regex = RegExp(r'\d+(?=\D*$)');
  RegExpMatch? match = regex.firstMatch(input);
  if (match != null) {
    return match.group(0);
  }
  return null;
}
