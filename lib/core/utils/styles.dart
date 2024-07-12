import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppStyles {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      unselectedItemColor: Colors.white,
      selectedItemColor: AppColor.primary,
      backgroundColor: AppColor.primary,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: false,
      showSelectedLabels: false,
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: AppColor.primary),
    ),
    textTheme: TextTheme(
      bodyMedium: GoogleFonts.poppins(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          color: AppColor.font),
      bodySmall: GoogleFonts.poppins(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: AppColor.font,
      ),
    ),
  );

  static final poppins11 = GoogleFonts.poppins(
    decoration: TextDecoration.lineThrough,
    decorationColor: AppColor.primary.withOpacity(.6),
    fontWeight: FontWeight.w400,
    fontSize: 11.sp,
    color: AppColor.primary.withOpacity(.6),
  );

  static final poppins12 = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 12.sp,
    color: AppColor.font.withOpacity(.6),
  );

  static final poppins14 = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    color: AppColor.font,
  );
  static final poppins18 = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontSize: 18.sp,
    color: AppColor.font,
  );
  static final poppins20 = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontSize: 20.sp,
    color: Colors.white,
  );
}
