import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  String format(Locale locale) {
    if (locale.languageCode == 'uk') {
      return toUkrFormat;
    }
    return toEngFormat;
  }

  String formatTime(Locale locale) {
    if (locale.languageCode == 'uk') {
      return toUkrTimeFormat;
    }
    return toEngTimeFormat;
  }

  String get toUkrFormat => DateFormat('dd.MM.yyyy').format(this);
  String get toEngFormat => DateFormat.yMd().format(this);
  String get toUkrTimeFormat => DateFormat('dd.MM.yyyy hh:mm:ss').format(this);
  String get toEngTimeFormat => DateFormat('yyyy/MM/dd hh:mm:ss').format(this);
}
