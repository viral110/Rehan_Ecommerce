import 'package:e_commerce/Api_Services/api.dart';
import 'package:e_commerce/Model/HomeScreenModel/home_screen_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';



class DataProvider with ChangeNotifier,DiagnosticableTreeMixin{
  DashBoardModel? dashBoardModel;


  bool isLoading = false;

  getDashBoardDetailsProvider(context) async {

    dashBoardModel = await ApiServices().dashBoardApi(context);
    isLoading = true;
    notifyListeners();
  }
}