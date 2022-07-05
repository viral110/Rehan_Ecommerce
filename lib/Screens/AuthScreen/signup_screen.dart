import 'package:e_commerce/Api_Services/api.dart';
import 'package:e_commerce/Screens/ProductScreens/home_screen.dart';
import 'package:e_commerce/Utility/color_utility.dart';
import 'package:e_commerce/Utility/common_button.dart';
import 'package:e_commerce/Utility/size_utility.dart';
import 'package:e_commerce/Utility/text_field.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  TextEditingController nameControoler = TextEditingController();
  TextEditingController emailControoler = TextEditingController();
  TextEditingController passwordControoler = TextEditingController();
  TextEditingController mobileControoler = TextEditingController();
  TextEditingController addressControoler = TextEditingController();

  bool check = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.close,
                          color: colorBDBDBD,
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: color5DB075,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 95,
                  ),
                  const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 68,
                  ),
                  textFieldNormal(
                      controller: nameControoler, textFieldName: "Name"),
                  const SizedBox(
                    height: 20,
                  ),
                  textFieldNormal(
                      controller: emailControoler, textFieldName: "Email"),
                  const SizedBox(
                    height: 20,
                  ),
                  passwordTextFienld(
                      controller: passwordControoler,
                      textFieldName: "Password"),
                  const SizedBox(
                    height: 20,
                  ),
                  textFieldNormal(
                      controller: mobileControoler, textFieldName: "Mobile"),
                  const SizedBox(
                    height: 20,
                  ),
                  textFormField(
                    controller: addressControoler,
                    textFieldName: "Address",
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    children: [
                      Checkbox(value: check, onChanged: (val) {}),
                      const SizedBox(
                        height: 20,
                        width: 10,
                      ),
                      Container(
                        width: getWidth(context: context) - 108,
                        child: Text(
                          "I would like to receive your newsletter and other promotional information.",
                          style: TextStyle(
                              color: color666666,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                          maxLines: 2,
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 62,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: commonButton(
                        name: "Sign Up",
                        OnCallBack: () {
                          ApiServices().registerAuth(
                              emailControoler.text,
                              passwordControoler.text,
                              nameControoler.text,
                              mobileControoler.text,
                              addressControoler.text,
                              context);
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
