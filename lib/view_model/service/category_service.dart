import 'dart:developer';

import 'package:api_demo/view_model/helper.dart';

class CategoryScreenService{
  static Future <dynamic> fetchData(String category) async{
    log("CategoryScreenService -> started");
    try{
      var decodedData = await ApiHelper.getData(endPoint: "/products/category/$category");
      return decodedData;
    }catch(e){
      log("$e");
    }
  }
}