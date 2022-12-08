import 'package:flutter/material.dart';

const Color bg = Colors.black;
const Color text = Colors.white;

ThemeData themeData() {
  return ThemeData(
    primarySwatch: Colors.blue,
    backgroundColor: bg,
    scaffoldBackgroundColor: bg,
    fontFamily: 'Roboto',
    iconTheme: const IconThemeData(color: text),
    appBarTheme: const AppBarTheme(color: bg),
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: text),
      bodyText2: TextStyle(color: text),
    ),
  );
}
