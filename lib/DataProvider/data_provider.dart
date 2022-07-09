import 'package:e_commerce/Api_Services/api.dart';
import 'package:e_commerce/Model/HomeScreenModel/home_screen_model.dart';
import 'package:e_commerce/Model/HomeScreenModel/product_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class DataProvider with ChangeNotifier, DiagnosticableTreeMixin {
  DashBoardModel? dashBoardModel;
  GetProductDetails? getProductDetails;

  bool isLoading = false;

  getDashBoardDetailsProvider(context) async {
    isLoading = false;
    dashBoardModel = await ApiServices().dashBoardApi(context);
    isLoading = true;
    notifyListeners();
  }

  getProductDetailProvider(context, productId) async {
    isLoading = false;
    getProductDetails =
        await ApiServices().productDetailsApi(context, productId);
    isLoading = true;
    notifyListeners();
  }
}
