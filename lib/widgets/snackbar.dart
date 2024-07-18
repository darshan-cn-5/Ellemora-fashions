import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:task/constants/colors.dart";

void showCustomSnackBar(BuildContext context, String text) {
  final snackBar = SnackBar(
    content: Text(
      text,
      style: TextStyle(color: Colors.white),
    ),
    backgroundColor: blueColor,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.r),
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
