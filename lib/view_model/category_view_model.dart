import 'dart:convert';

import 'package:api_demo/model/categorymodel.dart';
import 'package:api_demo/model/home_model.dart';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;

class CategoryViewModel with ChangeNotifier{
  List<String>categoryList = [
    "Electronics",
    "Jewelery",
    "Men's clothing",
    "Women's clothing",
    
  ];
  String category = "electronics";
  OnTap({required int index}){
    category = categoryList[index].toLowerCase();
    fetchData();
    print(category);
    notifyListeners();
  }
  late CategoryModel categoryModel ;
  bool isLoading = false;
  var baseurl ="https://fakestoreapi.com/products";

  fetchData()async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse("$baseurl/categories");
 print(category);
 final response = await http.get(url);
 print(response.statusCode);
 Map<String,dynamic>decodeData = {};
 if(response.statusCode == 200){
   decodeData = jsonDecode(response.body);
  }else{
    print("Api failed");
  }
   categoryModel= CategoryModel.fromJson(decodeData);
  isLoading = false;
  notifyListeners();
}
}