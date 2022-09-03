import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_app/shared/style/colors.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primarySwatch: AppColor.buildMaterialColor(AppColor.primaryColor),
      fontFamily: 'Roboto',
      appBarTheme: const AppBarTheme(
          actionsIconTheme: IconThemeData(color: Colors.black, size: 30),
          titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.3),
          backgroundColor: Colors.white,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark)),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        titleLarge: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
        displayMedium: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
        displaySmall: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
        titleSmall: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey),
        labelSmall: TextStyle(
            fontSize: 12, fontWeight: FontWeight.w300, color: Colors.grey),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding:
            const EdgeInsets.only(left: 25, right: 4.0, top: 8, bottom: 8),
        filled: true,
        fillColor: Colors.white,
        errorStyle: const TextStyle(color: Colors.red),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              color: Colors.blue,
            )),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              color: Colors.grey,
            )),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              color: Colors.red,
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              color: Colors.red,
            )),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              color: Colors.grey,
            )),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              color: Colors.grey,
            )),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 1.8),
          minimumSize: const Size(double.infinity, 50),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          // Foreground color

          // Background color
          primary: Colors.blue.shade900,
        ).copyWith(elevation: ButtonStyleButton.allOrNull(5)),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          elevation: 5,
          selectedItemColor: AppColor.primaryColor,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white));
}
