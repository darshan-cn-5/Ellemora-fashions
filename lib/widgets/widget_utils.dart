import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:task/constants/colors.dart";
import "package:task/utils/text_styles.dart";

initializeScreenSize(BuildContext context,
    {double width = 411.42857142857144, double height = 867.4285714285714}) {
  ScreenUtil.init(context, designSize: Size(width, height), minTextAdapt: true);
}

Widget custombutton(String text) {
  return Container(
    width: 360.w,
    height: 50.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: blueColor,
    ),
    child: Center(
      child: Text(
        text,
        style: normalWhiteTextStyle,
      ),
    ),
  );
}
