import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

Widget ProductCard(String title, String price, String imagename) {
  return Container(
    width: 200.w,
    child: Column(
      children: [
        Container(
          height: 140.h,
          width: 150.w,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                "https://fakestoreapi.com/img/${imagename}",
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          "${price}",
          style: TextStyle(fontSize: 18.sp),
        ),
      ],
    ),
  );
}
