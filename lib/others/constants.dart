import 'package:flutter/material.dart';

// PrimaryColor is of type Color
// PrimarySwatch only accepts a MaterialColor.
// We’ll create a cool function that will get a MaterialColor from a Color.
// MaterialColor is a color with a primary value (first param; int),
// and 10 shades of that color (second param; Map<int, Color>) with the int map key as the shade index

// (Important)Shade with index 500 is the primary color of that material color.
// So we needed to find a way to get darker and lighter shades of a certain color to create all the shades.

class AppColors {
  static List<Color> primaryColors = const [
    Color(0xffff5252),
    Color(0xff00c853),
    Color(0xff448aff),
    Color(0xffffab00),
  ];

  static Color getShade(Color color, {bool darker = false, double value = .1}) {
    assert(value >= 0 && value <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness(
        (darker ? (hsl.lightness - value) : (hsl.lightness + value))
            .clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  static MaterialColor getMaterialColorFromColor(Color color) {
    Map<int, Color> _colorShades = {
      50: getShade(color, value: 0.5),
      100: getShade(color, value: 0.4),
      200: getShade(color, value: 0.3),
      300: getShade(color, value: 0.2),
      400: getShade(color, value: 0.1),
      500: color,
      600: getShade(color, value: 0.1, darker: true),
      700: getShade(color, value: 0.15, darker: true),
      800: getShade(color, value: 0.2, darker: true),
      900: getShade(color, value: 0.25, darker: true),
    };
    return MaterialColor(color.value, _colorShades);
  }
}
