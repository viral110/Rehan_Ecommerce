import 'package:e_commerce/Api_Services/api.dart';
import 'package:e_commerce/Screens/AuthScreen/signup_Screen.dart';
import 'package:e_commerce/Screens/ProductScreens/home_screen.dart';
import 'package:e_commerce/Utility/color_utility.dart';
import 'package:e_commerce/Utility/common_button.dart';
import 'package:e_commerce/Utility/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        child: Container(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                ),
                const Text(
                  "Log in",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 57),
                textFieldNormal(
                    controller: emailController, textFieldName: "Email"),
                const SizedBox(height: 20),
                passwordTextFienld(
                    controller: passwordController, textFieldName: "Password"),
                const SizedBox(height: 62),
                commonButton(
                    name: "Log In",
                    OnCallBack: () {
                      ApiServices().loginAuth(emailController.text, passwordController.text, context);
                    }),
                const SizedBox(height: 23),
                Text(
                  "Forgot your password?",
                  style: TextStyle(
                      color: color5DB075,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 28,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => SignUpScreen());
                  },
                  child: Text(
                    "Need account ?",
                    style: TextStyle(
                        color: color5DB075,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 70,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
