import 'dart:developer';

import 'package:api_demo/global_widget/appbar_global.dart';
import 'package:api_demo/view/widgets/item.dart';
import 'package:api_demo/view/widgets/product_card.dart';
import 'package:api_demo/view_model/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  fetchData() {
    Provider.of<HomeScreenController>(context, listen: false)
        .fetchData(context);
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: GLAppBar(
        title: "OUR PRODUCTS",
        leading: Icon(null),
      ),
      body: Consumer<HomeScreenController>(builder: (context, hcontrol, child) {
        return hcontrol.isLoading == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: hcontrol.homeScreenModel.data?.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    // height: size.height * .2,
                    child: InkWell(
                      onTap: () {
                        log("tapped");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ItemViewScreen(
                                      title: hcontrol.homeScreenModel
                                              .data?[index].title ??
                                          "",
                                      price: hcontrol.homeScreenModel
                                              .data?[index].price ??
                                          0,
                                      description: hcontrol.homeScreenModel
                                              .data?[index].description ??
                                          "",
                                      category: hcontrol.homeScreenModel
                                              .data?[index].category
                                              .toString() ??
                                          "",
                                      imageUrl: hcontrol.homeScreenModel
                                              .data?[index].image ??
                                          "",
                                      rating: hcontrol.homeScreenModel
                                          .data?[index].rating?.rate,
                                    )));
                      },
                      child: ItemCard(
                        title:
                            hcontrol.homeScreenModel.data?[index].title ?? "",
                        price: hcontrol.homeScreenModel.data?[index].price ?? 0,
                        imageUrl:
                            hcontrol.homeScreenModel.data?[index].image ?? "",
                        rating:
                            hcontrol.homeScreenModel.data![index].rating?.rate,
                        size: size,
                      ),
                    ),
                  );
                });
      }),
    );
  }
}
