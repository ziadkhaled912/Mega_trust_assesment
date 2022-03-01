import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/constants.dart';

class AppTextStyles {
  static TextStyle largeTitleTextStyle() {
    return TextStyle(
      fontSize: 40.sp,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    );
  }

  static TextStyle headersTextStyle() {
    return TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    );
  }

  static TextStyle primaryTextStyle() {
    return TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    );
  }

  static TextStyle secondaryTextStyle() {
    return TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    );
  }

  static TextStyle thirdTextStyle() {
    return TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    );
  }

  static TextStyle subTextStyle() {
    return TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    );
  }
}
