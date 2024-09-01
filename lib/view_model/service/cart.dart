import 'dart:developer';

import 'package:api_demo/view_model/helper.dart';

class CartService{
  static Future <dynamic> fetchData() async {
    log("CartService  -> started");
    try{
      var decodedData = await ApiHelper.getData(endPoint: "/carts?userId=1");
      return decodedData;
    }catch(e){
      log("$e");
    }
  }
}