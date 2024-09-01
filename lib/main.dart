import 'package:api_demo/view/screens/splash.dart';
import 'package:api_demo/view_model/bottom_nav.dart';
import 'package:api_demo/view_model/cart.dart';
import 'package:api_demo/view_model/category.dart';
import 'package:api_demo/view_model/home.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => HomeScreenController()),
    ChangeNotifierProvider(create: (context) => BottomNavController()),
    ChangeNotifierProvider(create: (context) => CategoryController()),
    ChangeNotifierProvider(create: (context) => CartController()),

  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}