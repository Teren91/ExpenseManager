import 'package:flutter/material.dart';

class AppTheme {
    static const Color _primaryColorLight = Color(0xFF00BFA5);
    static const Color _primaryColorDark = Colors.deepPurple;

    static final ThemeData lightTheme = ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: _primaryColorLight,
        appBarTheme: const AppBarTheme(
            color: _primaryColorLight,
            iconTheme: IconThemeData(
                color: Colors.white,
            ),
            titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
        ),
        colorScheme: ColorScheme.fromSeed(
            seedColor: _primaryColorLight,
            primary: _primaryColorLight,
            brightness: Brightness.light,
        ),
        textTheme: const TextTheme(
            titleLarge: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
            ),
            titleMedium: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
            ),
            bodyMedium: TextStyle(
                fontSize: 16,
            ),
            bodyLarge: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
            )
        ),
    );

    static final ThemeData darkTheme = ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        primaryColor: _primaryColorDark,
        appBarTheme: const AppBarTheme(
            color: _primaryColorDark,
            iconTheme: IconThemeData(
                color: Colors.white,
            ),
            titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
        ),
        colorScheme: ColorScheme.fromSeed(
            seedColor: _primaryColorDark,
            primary: _primaryColorDark,
            brightness: Brightness.dark,
        ),
         textTheme: const TextTheme(
            titleLarge: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
            ),
            bodyMedium: TextStyle(
                fontSize: 16,
            ),
            bodyLarge: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
            )
        ),
    );
}