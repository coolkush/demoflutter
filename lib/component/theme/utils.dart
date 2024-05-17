import 'dart:developer';
import 'package:demoproject/component/commonfiles/appcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// Class containing the supported color schemes.
class ColorSchemes {
  static const primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0XFF2AB7C7),

    // On colors(text colors)
    onPrimary: Color(0XFFFFFFFF),
    onPrimaryContainer: Color(0X195C5C5C),
  );
}

class AppUtils {
  static keyboardHide(BuildContext context) {
    FocusScope.of(context).unfocus();
  }
}

/// Helper class for managing themes and colors.
class ThemeHelper {
  // The current app theme
  final _appTheme = PrefUtils().getThemeData();

// A map of custom color themes supported by the app
  final Map<String, AppColors> _supportedCustomColor = {'primary': AppColors()};

// A map of color schemes supported by the app
  final Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Returns the primary colors for the current theme.
  AppColors _getThemeColors() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    return _supportedCustomColor[_appTheme] ?? AppColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  AppColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing custom colors for a primary theme.

AppColors get appTheme => ThemeHelper().themeColor();
// ThemeData get theme => ThemeHelper().themeData();

class PrefUtils {
  static SharedPreferences? _sharedPreferences;

  PrefUtils() {
    // init();
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }

  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    log('SharedPreference Initialized');
  }

  ///will clear all the data stored in preference
  void clearPreferencesData() async {
    _sharedPreferences!.clear();
  }

  Future<void> setThemeString(String key, String value) {
    return _sharedPreferences!.setString(key, value);
  }

  Future<void> setThemeBool(String key, bool value) {
    return _sharedPreferences!.setBool('themeData', value);
  }
  // Future<void> setThemeData(String key, String value) {
  //   return _sharedPreferences!.setString('themeData', value);
  // }

  String getThemeData() {
    try {
      return _sharedPreferences!.getString('themeData')!;
    } catch (e) {
      return 'primary';
    }
  }

  String getPrefesData(String key) {
    try {
      return _sharedPreferences!.getString(key)!;
    } catch (e) {
      return 'primary';
    }
  }
}

// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyMedium: TextStyle(
          color: appTheme.blackColor,
          fontSize: 12.sp,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w300,
        ),
        bodySmall: TextStyle(
          color: appTheme.bgColor,
          fontSize: 10.sp,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        labelLarge: TextStyle(
          color: colorScheme.primary,
          fontSize: 11.sp,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: appTheme.blackColor,
          fontSize: 14.sp,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 12.sp,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
      );
}
