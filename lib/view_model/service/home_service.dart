import 'dart:developer';

import 'package:api_demo/view_model/helper.dart';


class HomeScreenService{
  static Future <dynamic> fetchData() async{
    log("HomeScreenService -> started");
    try{
      var decodedData = await ApiHelper.getData(endPoint: "/products");
      return decodedData;
    }catch(e){
      log("$e");
    }
  }
}