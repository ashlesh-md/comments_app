import 'package:flutter/material.dart';

/// These lines of code are defining constant Color variables with specific hexadecimal values in the
/// Dart programming language.
const Color primaryColor = Color(0xFF0C54BE);
const Color secondaryColor = Color(0xFF303F60);
const Color backgroundColor = Color(0xFFF5F9FD);
const Color surfaceColor = Color(0xFFCED3DC);

/// The code snippet is defining a custom ColorScheme named `customColorScheme` in Dart. A ColorScheme
/// is a set of colors that are used to define the color properties of a theme in Flutter applications.
final ColorScheme customColorScheme = ColorScheme(
  primary: primaryColor,
  primaryContainer: primaryColor.withOpacity(0.8),
  secondary: secondaryColor,
  secondaryContainer: secondaryColor.withOpacity(0.8),
  surface: surfaceColor,
  background: backgroundColor,
  error: Colors.red,
  onPrimary: Colors.white,
  onSecondary: Colors.white,
  onSurface: Colors.black,
  onBackground: Colors.black,
  onError: Colors.white,
  brightness: Brightness.light,
);

Color getColorForLetter(String letter) {
  const colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
    Colors.pink,
    Colors.cyan,
    Colors.teal,
    Colors.lime,
    Colors.brown,
    Colors.grey,
    Colors.amber,
    Colors.deepOrange,
    Colors.lightBlue,
    Colors.lightGreen,
    Colors.deepPurple,
    Colors.blueGrey,
    Colors.cyanAccent,
    Colors.indigoAccent,
    Colors.pinkAccent,
    Colors.purpleAccent,
    Colors.redAccent,
    Colors.tealAccent,
    Colors.yellowAccent,
  ];

  int index = letter.toUpperCase().codeUnitAt(0) - 65;
  if (index < 0 || index >= colors.length) {
    index = 0; // Default to the first color if index is out of range
  }
  return colors[index];
}
