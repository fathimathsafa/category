import 'dart:developer';
import 'package:api_demo/model/home_model.dart';
import 'package:api_demo/view_model/service/category_service.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_utils.dart';

class CategoryController with ChangeNotifier {
 HomeScreenModel categoryModel = HomeScreenModel();
  List<String> categoryList = [
    "Electronics",
    "Jewelery",
    "Men's clothing",
    "Women's clothing"
  ];
  bool isLoading = false;
  String category = "electronics";

  onTap({required int index,required BuildContext context}) {
    category = categoryList[index].toLowerCase();
    fetchData(context);
    log("tapped category -> $category");
    notifyListeners();
  }

  fetchData(context) {
    isLoading = true;
  notifyListeners();
  log("CategoryController -> fetchData");
  CategoryScreenService.fetchData(category).then((value) {
    log("CategoryScreenService.fetchData() started");
      if(value["status"]==1){
        log("data==== ->${value["data"]}");
        categoryModel = HomeScreenModel.fromJson(value);
        isLoading = false;
      }else{
        AppUtils.oneTimeSnackBar("error", context: context);
      }
    notifyListeners();
  });}
}