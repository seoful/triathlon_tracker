// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final styleProvider = ChangeNotifierProvider<Style>((ref) {
  return Style();
});

class Style extends ChangeNotifier {
  ThemeColor _themeColor;
  Style({
    ThemeColor? themeColor,
  }) : _themeColor = themeColor ?? ThemeColor.light;

  set themeColor(ThemeColor themeColor) {
    bool hasChanged = themeColor != _themeColor;

    _themeColor = themeColor;

    if (hasChanged) notifyListeners();
  }

  ThemeColor get themeColor => _themeColor;

  ColorsBundle get colors => mapThemeToColors(_themeColor);

  ColorsBundle mapThemeToColors(ThemeColor themeColor) =>
      themeColor == ThemeColor.light ? LightThemeColors() : DarkThemeColors();
}

enum ThemeColor { light, dark }

abstract class ColorsBundle {
  ColorsBundle();

  Color get backPrimary;
}

class LightThemeColors extends ColorsBundle {
  LightThemeColors();

  @override
  Color get backPrimary => Colors.white;
}

class DarkThemeColors extends ColorsBundle {
  @override
  Color get backPrimary => const Color(0xff161618);
}

class TextStyles {}
