import 'dart:io';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'constants.dart';

class StringUtil {
  static bool isValidEmail(String str) {
    final emailRegExp = RegExp(
        r"^^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    return emailRegExp.hasMatch(str);
  }
}

extension DateTimeExtension on DateTime {
  String timeAgo({bool numericDates = true}) {
    final date2 = DateTime.now();
    final difference = date2.difference(this);

    if ((difference.inDays / 7).floor() >= 1) {
      return (numericDates) ? 'Il y a 1 semaine' : 'La semaine dernière';
    } else if (difference.inDays >= 2) {
      return 'Il y a ${difference.inDays} jours';
    } else if (difference.inDays >= 1) {
      return (numericDates) ? 'Il y a 1 jour' : 'Hier';
    } else if (difference.inHours >= 2) {
      return 'Il y a ${difference.inHours} heures';
    } else if (difference.inHours >= 1) {
      return (numericDates) ? 'Il y a 1 heure' : 'Il y a une heure';
    } else if (difference.inMinutes >= 2) {
      return 'Il y a ${difference.inMinutes} minutes';
    } else if (difference.inMinutes >= 1) {
      return (numericDates) ? 'Il y a 1 minute ' : 'Il y a une minute';
    } else if (difference.inSeconds >= 3) {
      return 'Il y a ${difference.inSeconds} seconde';
    } else {
      return 'A l\'instant';
    }
  }
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

extension ExtensionParsing on File {
  bool isImage() {
    return imagesExtensions.any((element) =>
        (this.path.toLowerCase().contains(element) &&
            this.path.toLowerCase().lastIndexOf(element) > -1 &&
            this.path.toLowerCase().lastIndexOf(element) + element.length ==
                this.path.toLowerCase().length));
  }

  bool isDocument() {
    return documentsExtensions.any((element) =>
        (this.path.toLowerCase().contains(element) &&
            this.path.toLowerCase().lastIndexOf(element) > -1 &&
            this.path.toLowerCase().lastIndexOf(element) + element.length ==
                this.path.toLowerCase().length));
  }

  bool isMovie() {
    return videosExtensions.any((element) =>
        (this.path.toLowerCase().contains(element) &&
            this.path.toLowerCase().lastIndexOf(element) > -1 &&
            this.path.toLowerCase().lastIndexOf(element) + element.length ==
                this.path.toLowerCase().length));
  }
}

extension TextCustomFormater on String {
  bool isItalic() {
    print("indexOf ${this.indexOf("__")}");
    print("lastIndexOf ${this.lastIndexOf("__")}");
    print("length ${this.length}");
    return this.isNotEmpty &&
        this.contains("__") &&
        this.indexOf("__") == 0 &&
        this.lastIndexOf("__") == (this.length - 2);
  }

  List<String> splitWithDelim(RegExp pattern) =>
      pattern.allMatchesWithSep(this);

  bool isImoji() {
    return regexImojis.hasMatch(this);
  }

  String clear() {
    print("indexOf ${this.indexOf("__")}");
    String text = this;
    //while (text.indexOf("__") >= 0) {
    //text = text.substring(this.indexOf("__"), this.indexOf("__") + 2);
    //}
    return text;
  }
}

extension CurrencyFormater on String {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
// locale eu or fr_FR
  String formatCurrency({String locale = "eu", int decimalDigits = 2}) {
    if (this.isEmpty || this.toLowerCase() == "null") return "";

    return NumberFormat.currency(
            locale: locale, decimalDigits: decimalDigits, symbol: "€")
        .format(double.parse(this));
  }

  String formatDateyMMMd() {
    if (this.isEmpty) return "";
    DateFormat f = DateFormat.yMMMd("FR-fr");
    return f.format(DateTime.parse(this));
  }
}

Future<String> getFileData(String path) async {
  return await rootBundle.loadString(path);
}

Future<String> getCguDataHtml({String path = "res/terms.html"}) async {
  return await getFileData(path);
}

extension RegExpExtension on RegExp {
  List<String> allMatchesWithSep(String input, [int start = 0]) {
    var result = <String>[];

    for (var match in allMatches(input, start)) {
      String w = input.substring(start, match.start);
      result.add(w);
      result.add(match[0]!);
      start = match.end;
    }
    result.add(input.substring(start));

    return result;
  }
}

String ageRangeOf(List<String>? agesList) {
  const PREFIX_YEAR = "ANS";
  const PREFIX_MONTH = "MOIS";

  List<String> ageRangeMonth =
      (agesList ?? []).where((age) => age.contains(PREFIX_MONTH)).toList();
  List<String> ageRangeYeah =
      (agesList ?? []).where((age) => age.contains(PREFIX_YEAR)).toList();

  ageRangeMonth.sort();
  ageRangeYeah.sort();

  List<String> resultSortAges = ageRangeMonth;
  resultSortAges.addAll(ageRangeYeah);

  if (resultSortAges.length == 0) {
    return "Tous les âges";
  }

  if (resultSortAges.length == 1) {
    List<String> parts = resultSortAges.first.split('_');
    return "${parts[1]} - ${parts[2]} ${parts[0]}".toLowerCase();
  }

  String firstPartAge = resultSortAges.first.split('_')[1];
  String lastPartAge = resultSortAges.last.split('_')[2];
  String finalAge = "";

  if (resultSortAges.first.contains(PREFIX_MONTH) &&
      resultSortAges.last.contains(PREFIX_MONTH)) {
    finalAge = "$firstPartAge - $lastPartAge $PREFIX_MONTH";
  } else if (resultSortAges.first.contains(PREFIX_YEAR) &&
      resultSortAges.last.contains(PREFIX_YEAR)) {
    finalAge = "$firstPartAge - $lastPartAge $PREFIX_YEAR";
  } else {
    finalAge = "$firstPartAge $PREFIX_MONTH - $lastPartAge $PREFIX_YEAR";
  }

  return finalAge.toLowerCase();
}
