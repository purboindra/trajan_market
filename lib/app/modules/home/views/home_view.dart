import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:trajan_market/app/modules/main/controllers/main_controller.dart';
import 'package:trajan_market/app/routes/app_pages.dart';
import 'package:trajan_market/app/services/dimensions.dart';
import 'package:trajan_market/app/services/theme.dart';
import 'package:trajan_market/app/widgets/build_loading_all_products.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  // final int pageId;
  // final String page;

  // HomeView({required this.page, required this.pageId});
  @override
  Widget build(BuildContext context) {
    // Get.put(CartController(cartRepository: Get.find()));
    // Get.put(CartRepository());
    // Get.put(MainController());
    Get.find<MainController>();

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: InkWell(
          onTap: () {
            Get.offNamedUntil(Routes.MAIN, (route) => false);
          },
          child: Icon(
            Icons.arrow_back_ios,
            size: 24,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: ContainedTabBarView(
        tabBarProperties: TabBarProperties(
          unselectedLabelColor: Colors.grey.shade500,
          unselectedLabelStyle: TextStyle(
            color: Colors.black,
          ),
          labelColor: Colors.black,
          indicatorWeight: 3,
          indicatorColor: Colors.black,
          labelPadding: EdgeInsets.symmetric(
            horizontal: 15,
          ),
          labelStyle: titleStyle.copyWith(
            fontWeight: FontWeight.w600,
          ),
          isScrollable: true,
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
        ),
        tabs: [
          Text(
            "All Products",
          ),
          Text(
            "Electronics",
          ),
          Text(
            "Jewelery",
          ),
          Text(
            "Men's clothing",
          ),
          Text(
            "Women's clothing",
          ),
        ],
        callOnChangeWhileIndexIsChanging: true,
        views: controller.page,
      ),
    );
  }

  Widget buildAllProducts() {
    return GetBuilder<HomeController>(builder: (allProducts) {
      if (allProducts.dataLoading.isTrue) {
        return BuildLoadingAllProducts(itemCount: 20);
      } else {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.w10,
          ),
          margin: EdgeInsets.only(
            top: Dimensions.h20,
          ),
          child: GridView.builder(
              shrinkWrap: true,
              itemCount: allProducts.allProductList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: Dimensions.w30 * 8 - Dimensions.w10,
                mainAxisSpacing: Dimensions.w10,
                crossAxisSpacing: Dimensions.h10,
              ),
              itemBuilder: (context, index) {
                var data = allProducts.allProductList[index];

                return InkWell(
                  onTap: () {
                    print("home to details $index");
                    Get.toNamed(
                      AppPages.getDetailsPage(index, "home"),
                    );
                  },
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
        );
      }
    });
  }

  Widget buildElectronics() {
    return GetBuilder<HomeController>(
      builder: (homeC) => homeC.dataLoading.isTrue
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
                  itemCount: homeC.electronicsProducts.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: Dimensions.w30 * 8 - Dimensions.w10,
                    mainAxisSpacing: Dimensions.w10,
                    crossAxisSpacing: Dimensions.h10,
                  ),
                  itemBuilder: (context, index) {
                    var data = homeC.electronicsProducts[index];
                    return InkWell(
                      onTap: () {
                        // Get.toNamed(Routes.DETAILS, arguments: {
                        //   "electronics": homeC.electronicsProducts,
                        // });
                      },
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

  Widget buildJeweleryProducts() {
    return GetBuilder<HomeController>(
      builder: (homeC) => homeC.dataLoading.isTrue
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
                  itemCount: homeC.jeweleryProducts.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: Dimensions.w30 * 8 - Dimensions.w10,
                    mainAxisSpacing: Dimensions.w10,
                    crossAxisSpacing: Dimensions.h10,
                  ),
                  itemBuilder: (context, index) {
                    var data = homeC.jeweleryProducts[index];
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

  Widget buildMensClothingProducts() {
    return GetBuilder<HomeController>(
      builder: (homeC) => homeC.dataLoading.isTrue
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
                  itemCount: homeC.mensClothingProducts.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: Dimensions.w30 * 8 - Dimensions.w10,
                    mainAxisSpacing: Dimensions.w10,
                    crossAxisSpacing: Dimensions.h10,
                  ),
                  itemBuilder: (context, index) {
                    var data = homeC.mensClothingProducts[index];
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

  Widget buildWomensClothingProducts() {
    return GetBuilder<HomeController>(
      builder: (homeC) => homeC.dataLoading.isTrue
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
                  itemCount: homeC.womensClothingProducts.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: Dimensions.w30 * 8 - Dimensions.w10,
                    mainAxisSpacing: Dimensions.w10,
                    crossAxisSpacing: Dimensions.h10,
                  ),
                  itemBuilder: (context, index) {
                    var data = homeC.womensClothingProducts[index];
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
