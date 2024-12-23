import 'package:flutter/material.dart';
import '../../core/app_export.dart';

/// Helper class for managing themes and colors.
class ThemeHelper {
  // The current app theme
  var _appTheme = PrefUtils().getThemeData();

// A map of custom color themes supported by the app
  Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

// A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Changes the app theme to [_newTheme].
  void changeTheme(String _newTheme) {
    PrefUtils().setThemeData(_newTheme);
    Get.forceAppUpdate();
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

 ThemeData _getThemeData() {
  // Verificación del tema
  if (!_supportedColorScheme.containsKey(_appTheme)) {
    throw Exception(
        "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
  }

  var colorScheme =
      _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;

  return ThemeData(
    visualDensity: VisualDensity.standard,
    colorScheme: colorScheme,
    splashFactory: NoSplash.splashFactory,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    textTheme: TextThemes.textTheme(colorScheme),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            16,
          ),
        ),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
        padding: EdgeInsets.zero,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: Color(0XFFFFFFFF),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: appTheme.greenA700.withOpacity(0.5),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(
            12,
          ),
        ),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
        padding: EdgeInsets.zero,
      ),
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return colorScheme.primary;
        }
        return colorScheme.onSurface;
      }),
      visualDensity: const VisualDensity(
        vertical: -4,
        horizontal: -4,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: colorScheme.primary,
    ),
    dividerTheme: DividerThemeData(
      thickness: 2,
      space: 2,
      color: colorScheme.primary,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.black, // O usa appTheme.greenA700 para verde oscuro
    ),
  );
}

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.black900,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: colorScheme.onError,
          fontSize: getFontSize(
            13,
          ),
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w400,
        ),
        displayMedium: TextStyle(
          color: appTheme.black900,
          fontSize: getFontSize(
            40,
          ),
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w700,
        ),
        headlineMedium: TextStyle(
          color: appTheme.black900,
          fontSize: getFontSize(
            28,
          ),
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w700,
        ),
        titleLarge: TextStyle(
          color: appTheme.black900,
          fontSize: getFontSize(
            22,
          ),
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w700,
        ),
        titleMedium: TextStyle(
          color: appTheme.black900,
          fontSize: getFontSize(
            18,
          ),
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w700,
        ),
        titleSmall: TextStyle(
          color: appTheme.greenA700,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w500,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0X103238),
    primaryContainer: Color(0XFF283593),
    secondary: Color(0XFF283593),
    secondaryContainer: Color(0X295B38),
    tertiary: Color(0XFF283593),
    tertiaryContainer: Color(0X227A84),

    // Surface colors
    surface: Color(0XFF283593),
    surfaceTint: Color(0X00111111),
    surfaceContainerHighest: Color(0X227A84),

    // Error colors
    error: Color(0X00111111),
    errorContainer: Color(0XFFCC2131),
    onError: Color(0XFF808080),
    onErrorContainer: Color(0XFFFFFFFF),
    onInverseSurface: Color(0XFF808080),
    onPrimary: Color(0X00111111),
    onPrimaryContainer: Color(0XFFFFFFFF),
    onSecondary: Color(0XFFFFFFFF),
    onSecondaryContainer: Color(0XFF283593),
    onTertiary: Color(0XFFFFFFFF),
    onTertiaryContainer: Color(0XFF283593),

    // Other colors
    outline: Color(0X00111111),
    outlineVariant: Color(0XFF283593),
    scrim: Color(0XFF283593),
    shadow: Color(0X00111111),

    // Inverse colors
    inversePrimary: Color(0XFF283593),
    inverseSurface: Color(0X00111111),

    // Pending colors
    onSurface: Color(0XFFFFFFFF),
    onSurfaceVariant: Color(0XFF283593),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // Black
  Color get black900 => Color(0XFF000000);

  // Blue
  Color get blue100 => Color(0XFFCAE3F1);

  // BlueGray
  Color get blueGray100 => Color(0XFFD9D9D9);
  Color get blueGray300 => Color(0XFFA3A3B5);
  Color get blueGray400 => Color(0XFF888888);

  // Cyan
  Color get cyan50 => Color(0XFFDAF2F8);
  Color get cyan5001 => Color(0XFFDAF3F8);

  // DeepOrange
  Color get deepOrange100 => Color(0XFFF2C9BA);
  Color get deepOrange50 => Color(0XFFFFE6DD);
  Color get deepOrangeA700 => Color(0XFFCE3800);

  // Gray
  Color get gray200 => Color(0XFFEAEAEA);
  Color get gray50 => Color(0XFFF8F8F8);
  Color get gray700 => Color(0XFF696969);
  Color get gray800 => Color(0XFF384046);
  Color get gray80001 => Color(0XFF383E41);

  // Green
  Color get green50 => Color(0XFFE6F1DB);
  Color get greenA700 => Color(0X184C55);

  // Indigo
  Color get indigo100 => Color(0XFFD0DAF4);

  // LightGreen
  Color get lightGreen100 => Color(0XFFD9F4D0);
  Color get lightGreen600 => Color(0X184C55);

  // Lime
  Color get lime100 => Color(0XFFF4E9D0);

  // Orange
  Color get orange300 => Color(0XFFFEB65D);
  Color get orange700 => Color(0XFFC98400);
  Color get orangeA200 => Color(0XFFEFA83C);

  // Purple
  Color get purple50 => Color(0XFFF1D0F4);
  Color get purple5001 => Color(0XFFF5E6EF);

  // Red
  Color get red100 => Color(0XFFF4D0CF);
  Color get red700 => Color(0XFFCD3232);
  Color get red70001 => Color(0XFFD83636);

  // Teal
  Color get teal50 => Color(0XFFD0F4ED);
  Color get teal5001 => Color(0XFFDDEFE9);
  Color get teal5002 => Color(0XFFDDEFE8);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

class AppColor {
  static Color primaryColor = const Color(0x247380);
  static Color primaryLightColor = const Color(0xFFE6F1DB);

  static Color black = const Color(0xFF000000);
  static Color grey400 = const Color(0xFF808080);
  static Color grey300 = const Color(0xFFC5C5C5);
  static Color grey200 = const Color(0xFFF0F0F0);
  static Color grey100 = const Color(0xFFF8f8f8);
  static Color white = const Color(0xFFffffff);

  static Color success = const Color(0x227A84);
  static Color main = const Color(0x295B38);
  static Color error = const Color(0xFFD93636);
}
