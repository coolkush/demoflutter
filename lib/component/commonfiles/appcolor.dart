import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static final _instance = AppColors._();
  factory AppColors() => _instance;
  static AppColors get instance => _instance;

  Color get blackColor => const Color(0XFF000000);
  Color get bgColor => const Color.fromARGB(255, 158, 66, 66);
  Color get lightTextColor => const Color(0XFFE2E2E2);
  Color get darkSplashBackground => const Color(0XFFE2E2E2);
  Color get primaryBlue => const Color(0XFFE2E2E2);
  Color get lightHintColor => const Color(0XFFE2E2E2);
  Color get classBoxColor => const Color(0XFFE2E2E2);
  Color get thinGreyColor => const Color(0XFFE2E2E2);
  Color get calendarLightBackgroundColor => const Color(0XFFE2E2E2);
  Color get darkBottomNavBar => const Color(0XFFE2E2E2);
  Color get darkThinBlueColor => const Color(0XFFE2E2E2);
  Color get calendarDarkBackgroundColor => const Color(0XFFE2E2E2);
  Color get studentAttendanceSelectedColor => const Color(0XFFE2E2E2);
}
