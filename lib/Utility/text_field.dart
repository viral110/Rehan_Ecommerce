import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_utility.dart';

textFieldNormal({
  String textFieldName = "",
  required TextEditingController controller,
}) {
  return Container(
    decoration: BoxDecoration(
      color: colorF6F6F6,
      borderRadius: BorderRadius.circular(12.sp),
      border: Border.all(color: const Color(0xFFE8E8E8)),
    ),
    padding: EdgeInsets.symmetric(
      vertical: 5.h,
    ),
    child: TextField(
      controller: controller,
      style: GoogleFonts.inter(
        fontSize: 15.sp,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.sp),
          borderSide: BorderSide.none,
        ),
        hintText: textFieldName,
        hintStyle: GoogleFonts.inter(
          color: Color(0xFFFBDBDBD),
        ),
      ),
    ),
  );
}

passwordTextFienld(
    {String textFieldName = "", required TextEditingController controller}) {
  return Container(
    decoration: BoxDecoration(
      color: colorF6F6F6,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: const Color(0xFFE8E8E8),
      ),
    ),
    padding: EdgeInsets.symmetric(
      vertical: 5.h,
    ),
    child: TextField(
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none),
        hintText: textFieldName,
        hintStyle: GoogleFonts.inter(color: colorBDBDBD),
        suffix: Text(
          "Show",
          style: GoogleFonts.inter(
            color: color5DB075,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  );
}

textFormField({
  String textFieldName = "",
  required TextEditingController controller,
}) {
  return Container(
    decoration: BoxDecoration(
        color: colorF6F6F6,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorF6F6F6)),
    child: TextFormField(
      keyboardType: TextInputType.multiline,
      maxLines: 10,
      minLines: 8,
      controller: controller,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none),
          hintText: textFieldName,
          hintStyle: TextStyle(color: colorBDBDBD)),
    ),
  );
}
