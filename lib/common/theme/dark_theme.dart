import 'package:flutter/material.dart';
import 'package:whats_app/common/extension/custom_theme_extension.dart';
import 'package:whats_app/common/utils/colors.dart';

ThemeData darkTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
      backgroundColor: Coloors.backgroundDark,
      scaffoldBackgroundColor: Coloors.backgroundDark,
      extensions: [CustomThemeExtension.darkMode],
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Coloors.backgroundDark,
          backgroundColor: Coloors.greenDark,
          splashFactory: NoSplash.splashFactory,
          elevation: 0,
          shadowColor: Colors.transparent,
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Coloors.greyBackground,
        modalBackgroundColor: Coloors.greyBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
      ));
}
