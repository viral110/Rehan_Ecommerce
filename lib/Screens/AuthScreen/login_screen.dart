import 'package:e_commerce/Api_Services/api.dart';
import 'package:e_commerce/Screens/AuthScreen/signup_Screen.dart';
import 'package:e_commerce/Screens/ProductScreens/home_screen.dart';
import 'package:e_commerce/Utility/color_utility.dart';
import 'package:e_commerce/Utility/common_button.dart';
import 'package:e_commerce/Utility/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
        child: SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 150.h,
                ),
                Text(
                  "Log in",
                  style: GoogleFonts.inter(
                    fontSize: 50.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 57.h),
                textFieldNormal(
                    controller: emailController, textFieldName: "Email"),
                SizedBox(height: 20.h),
                passwordTextFienld(
                    controller: passwordController, textFieldName: "Password"),
                SizedBox(height: 60.h),
                commonButton(
                  name: "Log In",
                  OnCallBack: () {
                    ApiServices().loginAuth(
                      emailController.text,
                      passwordController.text,
                      context,
                    );
                  },
                ),
                const SizedBox(height: 23),
                Text(
                  "Forgot your password?",
                  style: GoogleFonts.inter(
                    color: color5DB075,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 28.h,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(
                      () => SignUpScreen(),
                    );
                  },
                  child: Text(
                    "Need account ?",
                    style: GoogleFonts.inter(
                      color: color5DB075,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
