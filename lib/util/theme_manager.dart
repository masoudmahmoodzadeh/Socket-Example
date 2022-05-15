import 'package:flutter/material.dart';

import '../base/base_colors.dart';

class ThemeManager {
  ThemeData create() {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: BaseColors.primary,
        secondary: BaseColors.secondary,
      ),
      inputDecorationTheme: _inputDecoration(),
      elevatedButtonTheme: _buildElevatedButton(),
      cardTheme: _buildCardTheme(),
      primarySwatch: Colors.blue,
    );
  }

  InputDecorationTheme _inputDecoration() {
    return const InputDecorationTheme(
      helperStyle: TextStyle(
        fontSize: 15,
        color: Colors.white,
      ),
      labelStyle: TextStyle(fontSize: 15, color: Colors.white),
      hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
      errorStyle: TextStyle(fontSize: 15, color: Colors.red),
      counterStyle: TextStyle(fontSize: 10, color: Colors.white),
    );
  }

  ElevatedButtonThemeData _buildElevatedButton() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 3,
        primary: BaseColors.pink,
        onPrimary: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  CardTheme _buildCardTheme(){
    return CardTheme(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }

}
