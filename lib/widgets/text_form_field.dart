import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:flutter/services.dart';
import 'package:task/constants/colors.dart';

Widget CustomTextFormField(
  BuildContext context,
  String label,
  TextEditingController controller, {
  bool withSuffix = false,
  bool minLines = false,
  bool isPassword = false,
  bool isEnabled = true,
  bool isPrefix = false,
  Widget? prefixIcon,
  double? height,
  String? suffixIcon,
  Function? suffixFunction,
  List<TextInputFormatter>? inputFormatters,
  FormFieldValidator<String>? validator,
  BoxConstraints? constraints,
  ValueChanged<String>? onChanged,
  double vertical = 20,
  double horizontal = 20,
  double suffixHeight = 24,
  double suffixWidth = 24,
  double suffixRightPad = 18,
  int? maxLength,
  String obscuringCharacter = '•',
  GestureTapCallback? onTap,
  bool isReadOnly = false,
  TextInputType? keyboardType,
}) {
  return StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) {
      return SizedBox(
        height: height,
        child: TextFormField(
          readOnly: isReadOnly,
          onTap: onTap,
          onChanged: onChanged,
          validator: validator,
          enabled: isEnabled,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          maxLines: minLines ? null : 1,
          controller: controller,
          obscuringCharacter: isPassword ? obscuringCharacter : ' ',
          autofocus: false,
          obscureText: isPassword,
          showCursor: true,
          cursorColor: Colors.black,
          maxLength: maxLength,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 15.sp,
          ),
          decoration: InputDecoration(
            labelText: label,
            contentPadding: EdgeInsets.only(
              top: vertical.h + 20.h,
              left: horizontal.h,
              right: horizontal.h,
              bottom: vertical.h + 20.h,
            ),
            isDense: true,
            filled: true,
            fillColor: fillColor,
            suffixIcon: withSuffix
                ? IconButton(
                    onPressed: () {
                      suffixFunction!();
                    },
                    icon: Icon(Icons.visibility),
                  )
                : null,
            prefixIcon: isPrefix ? prefixIcon : null,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(22.h),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(22.h),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(22.h),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(22.h),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(22.h),
            ),
          ),
        ),
      );
    },
  );
}
