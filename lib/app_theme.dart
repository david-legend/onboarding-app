import 'package:flutter/material.dart';
import 'package:onboardingapp/values/values.dart';

class OnBoardingAppThemeData {
  static const _lightFillColor = Colors.black;

  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);

  static ThemeData lightThemeData =
      themeData(lightColorScheme, _lightFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: _textTheme,
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      accentColor: colorScheme.primary,
      focusColor: AppColors.violetShade1,
    );
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: Color(0xFFB93C5D),
    primaryVariant: Color(0xFF117378),
    secondary: Color(0xFFEFF3F3),
    secondaryVariant: Color(0xFFFAFBFB),
    background: AppColors.backgroundColor,
    surface: Color(0xFFFAFBFB),
    onBackground: Colors.white,
    error: _lightFillColor,
    onError: _lightFillColor,
    onPrimary: _lightFillColor,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );

  static const _regular = FontWeight.w400;
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;
  static const _medium = FontWeight.w500;
  static const _light = FontWeight.w300;

  static final TextTheme _textTheme = TextTheme(
    headline: TextStyle(
      fontFamily: StringConst.FONT_FAMILY,
      fontWeight: _bold,
      fontSize: Sizes.TEXT_SIZE_24,
      fontStyle: FontStyle.normal,
    ),
    body1: TextStyle(
      fontFamily: StringConst.FONT_FAMILY,
      fontWeight: _light,
      fontSize: Sizes.TEXT_SIZE_16,
      fontStyle: FontStyle.normal,
    ),
    title: TextStyle(
      fontFamily: StringConst.FONT_FAMILY,
      fontWeight: _medium,
      fontSize: Sizes.TEXT_SIZE_16,
      fontStyle: FontStyle.normal,
    ),
    subtitle: TextStyle(
      fontFamily: StringConst.FONT_FAMILY,
      fontWeight: _medium,
      fontSize: Sizes.TEXT_SIZE_16,
      fontStyle: FontStyle.normal,
    ),
    button: TextStyle(
      fontFamily: StringConst.FONT_FAMILY,
      color: AppColors.whiteShade1,
      fontWeight: _medium,
      fontSize: Sizes.TEXT_SIZE_14,
      fontStyle: FontStyle.normal,
    ),
  );
}
