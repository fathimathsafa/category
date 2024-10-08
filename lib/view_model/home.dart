import 'dart:developer';

import 'package:api_demo/core/utils/app_utils.dart';
import 'package:api_demo/model/home_model.dart';
import 'package:api_demo/view_model/service/home_service.dart';
import 'package:flutter/cupertino.dart';

class HomeScreenController extends ChangeNotifier {
  List <HomeScreenModel> datas=[];
  HomeScreenModel homeScreenModel = HomeScreenModel();
  bool isLoading = false;
  int cartItemCount = 0;
  List<HomeScreenModel> cartItems = [];
  fetchData(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    log("HomeScreenController -> fetchData");

    try {
      final value = await HomeScreenService.fetchData();
      log("HomeScreenService.fetchData() started");

      if (value != null) {
        if (value["status"] == 1) {
          homeScreenModel = HomeScreenModel.fromJson(value);
          isLoading = false;
        } else {
          AppUtils.oneTimeSnackBar("error", context: context);
        }
      } else {
        AppUtils.oneTimeSnackBar("error", context: context);
      }
    } catch (e) {
      print("Error fetching data: $e");
      isLoading = false;
    }

    notifyListeners();
  }
  void addToCart(HomeScreenModel item) {
    cartItems.add(item); // Add item to cart
    cartItemCount++; // Increment cart item count
    notifyListeners(); // Notify listeners to update UI
  }
  void incrementCartItemCount() {
    cartItemCount++;
    notifyListeners();
  }

 
}