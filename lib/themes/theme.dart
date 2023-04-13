import 'package:flutter/material.dart';

// https://api.flutter.dev/flutter/material/ThemeData-class.html
ThemeData lightThemeData = ThemeData();

ThemeData darkThemeData = ThemeData(
    // Define the default brightness and colors.
    brightness: Brightness.dark,
    primaryColor: Colors.tealAccent,

    snackBarTheme: SnackBarThemeData(
      backgroundColor: Colors.grey[900],
      contentTextStyle: const TextStyle(color: Colors.white,)

    )
  );


