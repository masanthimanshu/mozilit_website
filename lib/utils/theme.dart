import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData appTheme = ThemeData(
  textTheme: GoogleFonts.poppinsTextTheme(),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    elevation: 1,
    foregroundColor: Colors.black,
    backgroundColor: Colors.white,
  ),
  elevatedButtonTheme: const ElevatedButtonThemeData(
    style: ButtonStyle(
      elevation: MaterialStatePropertyAll(0),
      side: MaterialStatePropertyAll(
        BorderSide(width: 2, color: Colors.grey),
      ),
      backgroundColor: MaterialStatePropertyAll(Colors.white),
      foregroundColor: MaterialStatePropertyAll(Colors.black),
      textStyle: MaterialStatePropertyAll(
        TextStyle(fontWeight: FontWeight.bold),
      ),
      padding: MaterialStatePropertyAll(
        EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 40,
        ),
      ),
    ),
  ),
);
