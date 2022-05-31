import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:trajan_market/app/controller/all_products_controller.dart';
import 'package:trajan_market/app/controller/electronics_controller.dart';
import 'package:trajan_market/app/controller/jewelery_controller.dart';
import 'package:trajan_market/app/controller/men_clothing_controller.dart';
import 'package:trajan_market/app/controller/women_clothing_controller.dart';
import 'package:trajan_market/app/services/dimensions.dart';
import 'package:trajan_market/app/services/theme.dart';
import 'package:trajan_market/app/widgets/build_loading_all_products.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SizedBox(),
    );
  }

  Widget buildAllProducts() {
    final homeCont = Get.find<AllProductsController>();

    return Obx(
      () => homeCont.dataLoading.isTrue
          ? BuildLoadingAllProducts(
              itemCount: 20,
            )
          : Container(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.w10,
              ),
              margin: EdgeInsets.only(
                top: Dimensions.h20,
              ),
              child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: homeCont.products!.allProductsModel!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: Dimensions.w30 * 8 - Dimensions.w10,
                    mainAxisSpacing: Dimensions.w10,
                    crossAxisSpacing: Dimensions.h10,
                  ),
                  itemBuilder: (context, index) {
                    var data = homeCont.products!.allProductsModel![index];
                    return InkWell(
                      onTap: () {},
                      child: Card(
                        elevation: 1.5,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.w10,
                            vertical: Dimensions.h10,
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: Dimensions.h10 * 10,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage("${data.image}"),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Expanded(
                                child: Text(
                                  "${data.title}",
                                  overflow: TextOverflow.ellipsis,
                                  style: subTitleStyle.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 2,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "\$ ${data.price}",
                                  overflow: TextOverflow.ellipsis,
                                  style: subTitleStyle.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
    );
  }

  Widget buildEelectronics() {
    final homeC = Get.find<ElectronicsController>();

    return Obx(
      () => homeC.dataLoading.isTrue
          ? BuildLoadingAllProducts(
              itemCount: 20,
            )
          : Container(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.w10,
              ),
              margin: EdgeInsets.only(
                top: Dimensions.h20,
              ),
              child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: homeC.products!.allProductsModel!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: Dimensions.w30 * 8 - Dimensions.w10,
                    mainAxisSpacing: Dimensions.w10,
                    crossAxisSpacing: Dimensions.h10,
                  ),
                  itemBuilder: (context, index) {
                    var data = homeC.products!.allProductsModel![index];
                    return InkWell(
                      onTap: () {},
                      child: Card(
                        elevation: 1.5,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.w10,
                            vertical: Dimensions.h10,
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: Dimensions.h10 * 10,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage("${data.image}"),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Expanded(
                                child: Text(
                                  "${data.title}",
                                  overflow: TextOverflow.ellipsis,
                                  style: subTitleStyle.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 2,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "\$ ${data.price}",
                                  overflow: TextOverflow.ellipsis,
                                  style: subTitleStyle.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
    );
  }

  Widget buildJewelery() {
    final homeC = Get.find<JeweleryController>();

    return Obx(
      () => homeC.dataLoading.isTrue
          ? BuildLoadingAllProducts(
              itemCount: 20,
            )
          : Container(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.w10,
              ),
              margin: EdgeInsets.only(
                top: Dimensions.h20,
              ),
              child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: homeC.products!.allProductsModel!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: Dimensions.w30 * 8 - Dimensions.w10,
                    mainAxisSpacing: Dimensions.w10,
                    crossAxisSpacing: Dimensions.h10,
                  ),
                  itemBuilder: (context, index) {
                    var data = homeC.products!.allProductsModel![index];
                    return InkWell(
                      onTap: () {},
                      child: Card(
                        elevation: 1.5,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.w10,
                            vertical: Dimensions.h10,
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: Dimensions.h10 * 10,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage("${data.image}"),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Expanded(
                                child: Text(
                                  "${data.title}",
                                  overflow: TextOverflow.ellipsis,
                                  style: subTitleStyle.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 2,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "\$ ${data.price}",
                                  overflow: TextOverflow.ellipsis,
                                  style: subTitleStyle.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
    );
  }

  Widget buildMensClothing() {
    final homeC = Get.find<MensClothingController>();

    return Obx(
      () => homeC.dataLoading.isTrue
          ? BuildLoadingAllProducts(
              itemCount: 20,
            )
          : Container(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.w10,
              ),
              margin: EdgeInsets.only(
                top: Dimensions.h20,
              ),
              child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: homeC.products!.allProductsModel!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: Dimensions.w30 * 8 - Dimensions.w10,
                    mainAxisSpacing: Dimensions.w10,
                    crossAxisSpacing: Dimensions.h10,
                  ),
                  itemBuilder: (context, index) {
                    var data = homeC.products!.allProductsModel![index];
                    return InkWell(
                      onTap: () {},
                      child: Card(
                        elevation: 1.5,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.w10,
                            vertical: Dimensions.h10,
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: Dimensions.h10 * 10,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage("${data.image}"),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Expanded(
                                child: Text(
                                  "${data.title}",
                                  overflow: TextOverflow.ellipsis,
                                  style: subTitleStyle.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 2,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "\$ ${data.price}",
                                  overflow: TextOverflow.ellipsis,
                                  style: subTitleStyle.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
    );
  }

  Widget buildWomensClothing() {
    final homeC = Get.find<WomensController>();

    return Obx(
      () => homeC.dataLoading.isTrue
          ? BuildLoadingAllProducts(
              itemCount: 20,
            )
          : Container(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.w10,
              ),
              margin: EdgeInsets.only(
                top: Dimensions.h20,
              ),
              child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: homeC.products!.allProductsModel!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: Dimensions.w30 * 8 - Dimensions.w10,
                    mainAxisSpacing: Dimensions.w10,
                    crossAxisSpacing: Dimensions.h10,
                  ),
                  itemBuilder: (context, index) {
                    var data = homeC.products!.allProductsModel![index];
                    return InkWell(
                      onTap: () {},
                      child: Card(
                        elevation: 1.5,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.w10,
                            vertical: Dimensions.h10,
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: Dimensions.h10 * 10,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage("${data.image}"),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Expanded(
                                child: Text(
                                  "${data.title}",
                                  overflow: TextOverflow.ellipsis,
                                  style: subTitleStyle.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 2,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "\$ ${data.price}",
                                  overflow: TextOverflow.ellipsis,
                                  style: subTitleStyle.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
    );
  }
}
