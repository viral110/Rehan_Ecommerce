
import 'dart:convert';
import 'dart:io';

import 'package:e_commerce/Model/login_model.dart';
import 'package:e_commerce/Screens/ProductScreens/home_screen.dart';
import 'package:e_commerce/Utility/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

const storageKey = FlutterSecureStorage();


class ApiServices {
  Future loginAuth(String email,String password, BuildContext context) async {
    try {
      final result = await InternetAddress.lookup("google.com");
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        var url = Uri.parse(StringHelperForApiUrl.baseUrl + "login");
        final response = await http.post(url, headers: {
          "Accept": "Application/json",
        }, body: {
          'email': email,
          'password':password,
        });
        print(response.body);
        var decoded = jsonDecode(response.body);

        if (response.statusCode == 200) {
          LoginModel loginModel = LoginModel.fromJson(decoded);
          await storageKey.write(
              key: 'access_token', value: loginModel.token);

          Fluttertoast.showToast(msg: "Login successfully");
          Get.to(() => const HomeScreen());
        }else{
          Fluttertoast.showToast(msg: "${decoded['msg']}");
        }
      } else {
        Fluttertoast.showToast(msg: "No Internet");
      }
    } catch (e) {
      debugPrint("Error Is : $e");
      Fluttertoast.showToast(msg: "Something went Wrong");
    }
  }

  Future registerAuth(String email,String password, String name, String phone, String address,BuildContext context) async {
    try {
      final result = await InternetAddress.lookup("google.com");
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        var url = Uri.parse(StringHelperForApiUrl.baseUrl + "signUp");
        final response = await http.post(url, headers: {
          "Accept": "Application/json",
        }, body: {
          'name':name,
          'email': email,
          'phone': phone,
          'address':address,
          'password':password,
        });
        print(response.body);
        var decoded = jsonDecode(response.body);
        if (response.statusCode == 200) {


          Fluttertoast.showToast(msg: "Register successfully");
          Get.to(() => const HomeScreen());
        }else{
          Fluttertoast.showToast(msg: "Already Registered");
        }
      } else {
        Fluttertoast.showToast(msg: "No Internet");
      }
    } catch (e) {
      debugPrint("Error Is : $e");
      Fluttertoast.showToast(msg: "Something went Wrong");
    }
  }
}