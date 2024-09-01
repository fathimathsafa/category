import 'package:api_demo/view/screens/category_screens.dart';
import 'package:api_demo/view/screens/home.dart';
import 'package:flutter/material.dart';

class BottomNavController with ChangeNotifier {
  int selectedIndex = 0;

  void onItemTap(index) {
    selectedIndex = index;
    notifyListeners();
  }

  List<Widget> screens = [HomeScreen(), CategoryScreen()];
}