import 'package:intl/intl.dart';

class AppCurrencySymbolOnPrice {
  String getCurrencySymbolPlaceholder({required double? moneyAmount}) {
    String currency = getCurrencySymbolByCountryCode("BD");

    // Proper rounding before formatting
    /*  final roundedValue = ((moneyAmount ?? 0) * 100).ceilToDouble() / 100;
    final format = NumberFormat("#,##0.00", "en_BD");

    return format.format(roundedValue);*/
    String moneyAmountString = formatCurrencyAmount(
      amount: moneyAmount ?? 0,
      countryCode: "BD",
    );

    return "$currency$moneyAmountString";
  }

  String formatCurrencyAmount({
    required double amount,
    required String countryCode,
  }) {
    String locale =
        (countryCode == "BD" || countryCode == "IN") ? "en_IN" : "en_US";
    // NumberFormat formatter = NumberFormat("#,##,##00.00", locale);
    NumberFormat formatter = NumberFormat.decimalPatternDigits(
      locale: locale,
      decimalDigits: 2,
    );
    return formatter.format(amount);
  }

  getCurrencySymbolByCountryCode(String countryCode) {
    switch (countryCode) {
      case "BD":
        return "৳";
      case "US":
        return "\$";
      case "IN":
        return "₹";
      case "EU":
        return "€";
      case "GB":
        return "£";
      case "JP":
        return "¥";
      case "CA":
        return "C\$";
      case "AU":
        return "A\$";
      case "CH":
        return "Fr";
      case "CN":
        return "¥";
      case "DK":
        return "kr";
      case "HK":
        return "HK\$";
      case "NZ":
        return "NZ\$";
      case "SG":
        return "S\$";
      case "SE":
        return "kr";
      case "TW":
        return "NT\$";
      default:
        return "₹";
    }
  }
}
