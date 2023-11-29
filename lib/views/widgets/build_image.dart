import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

Widget buildImage({
  String? imageAsset,
}) {
  return Container(
    height: 75.sp,
    width: 75.sp,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(imageAsset!),
        fit: BoxFit.fill,
      ),
    ),
  );
}
