import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  focusColor: Colors.transparent,
  scaffoldBackgroundColor: Colors.white,
  textTheme: GoogleFonts.poppinsTextTheme(),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    foregroundColor: Colors.black,
    backgroundColor: Colors.white,
  ),
  tabBarTheme: const TabBarTheme(
    labelColor: Colors.black,
    labelStyle: TextStyle(
      fontWeight: FontWeight.bold,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      foregroundColor: const MaterialStatePropertyAll(Colors.black),
      padding: const MaterialStatePropertyAll(
        EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      ),
      textStyle: const MaterialStatePropertyAll(
        TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
  ),
  elevatedButtonTheme: const ElevatedButtonThemeData(
    style: ButtonStyle(
      elevation: MaterialStatePropertyAll(0),
      backgroundColor: MaterialStatePropertyAll(Colors.green),
      foregroundColor: MaterialStatePropertyAll(Colors.black),
      shape: MaterialStatePropertyAll(
        BeveledRectangleBorder(borderRadius: BorderRadius.zero),
      ),
      padding: MaterialStatePropertyAll(
        EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      ),
      textStyle: MaterialStatePropertyAll(
        TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
  ),
);
