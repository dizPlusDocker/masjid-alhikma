import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

BorderRadius buildDefaultBorderRadius() {
  return BorderRadius.only(
    topRight: Radius.circular(2.sp),
    bottomRight: Radius.circular(25.sp),
    bottomLeft: Radius.circular(2.sp),
    topLeft: Radius.circular(25.sp),
  );
}
