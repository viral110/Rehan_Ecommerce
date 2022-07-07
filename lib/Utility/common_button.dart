import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

commonButton(
    {String name = "",
    Color backgroundColor = const Color(0xff5DB075),
    Color textColor = const Color(0xffFFFFFF),
    double? height,
    double? width,
    required GestureTapCallback OnCallBack}) {
  return GestureDetector(
    onTap: OnCallBack,
    child: Container(
      height: height ?? 60.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        name,
        style: GoogleFonts.inter(
          color: textColor,
          fontWeight: FontWeight.w600,
          fontSize: 18.sp,
        ),
      ),
    ),
  );
}
