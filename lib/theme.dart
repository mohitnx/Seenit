import 'package:flutter/material.dart';

class Pallete {
  // Colors
  static const blackColor = Color.fromRGBO(11, 11, 11, 1);
  static const greyColor = Color.fromRGBO(40, 40, 40, 1);
  static const drawerColor = Color.fromRGBO(20, 19, 19, 1);
  static const whiteColor = Colors.white;
  static var cyan = Color.fromARGB(255, 54, 222, 244);
  static var blueColor = Colors.blue.shade300;

  // Themes
  static var darkModeAppTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: blackColor,
    cardColor: greyColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: drawerColor,
      iconTheme: IconThemeData(
        color: whiteColor,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: drawerColor,
    ),
    primaryColor: cyan,
    backgroundColor: drawerColor,
  );

  static var lightModeAppTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: whiteColor,
    cardColor: greyColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: whiteColor,
      elevation: 0,
      iconTheme: IconThemeData(
        color: blackColor,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: whiteColor,
    ),
    primaryColor: cyan,
    backgroundColor: whiteColor,
  );
}
