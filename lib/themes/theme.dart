import 'package:flutter/material.dart';

// https://api.flutter.dev/flutter/material/ThemeData-class.html
ThemeData lightThemeData = ThemeData();

ThemeData darkThemeData = ThemeData(
  // Define the default brightness and colors.
  brightness: Brightness.dark,
  primaryColor: Colors.tealAccent,

  snackBarTheme: SnackBarThemeData(
    backgroundColor: Colors.grey.shade900,
    contentTextStyle: const TextStyle(color: Colors.white,)
  ),

  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(foregroundColor:MaterialStateProperty.all(Colors.tealAccent)),
  ),
  
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor:MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return Colors.grey.shade800; 
          }
          else {
            return Colors.teal.shade600;
          }
        }
      )
    )
  ),

);
