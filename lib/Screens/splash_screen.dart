// import 'dart:async';

import 'dart:async';

import 'package:e_commerce/Api_Services/api.dart';
import 'package:e_commerce/Screens/AuthScreen/login_screen.dart';
import 'package:e_commerce/Screens/AuthScreen/signup_screen.dart';
import 'package:e_commerce/Screens/ProductScreens/home_screen.dart';
import 'package:e_commerce/Utility/color_utility.dart';
import 'package:e_commerce/Utility/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    splashTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(19),
            color: colorD9D9D9,
          ),
        ),
      ),
    );
  }

  splashTimer() async {
    final token = await storageKey.read(key: 'access_token');
    if (token != null) {
      Future.delayed(
        const Duration(seconds: SPLASH_TIMER),
        () => Get.off(() => const HomeScreen()),

      );
    } else {
      Future.delayed(
        const Duration(seconds: SPLASH_TIMER),
        () => Get.off(() => LoginScreen()),
      );
    }
  }
}
