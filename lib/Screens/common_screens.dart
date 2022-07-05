import 'package:e_commerce/Utility/color_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

commonAppBar() {
  return Expanded(
      flex: 1,
      child: Container(
        alignment: Alignment.centerLeft,
        width: double.infinity,
        color: color5DB075,
        child: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Image.asset(
              "asset/icon/lefetside.png",
              scale: 4,
            ),
          ),
        ),
      ));
}
