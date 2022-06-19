import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:trajan_market/app/model/all_products_model.dart';
import 'package:trajan_market/app/modules/main/controllers/main_controller.dart';
import 'package:trajan_market/app/routes/app_pages.dart';
import 'package:trajan_market/app/services/dimensions.dart';
import 'package:trajan_market/app/services/theme.dart';
import 'package:trajan_market/app/widgets/build_loading_all_products.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
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
      var listData = allProducts.getAllData();
      return FutureBuilder<List<AllProductsModel>>(
          future: listData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<AllProductsModel> varData = snapshot.data!;
              return Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.w10,
                ),
                margin: EdgeInsets.only(
                  top: Dimensions.h20,
                ),
                child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: varData.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: Dimensions.w30 * 8 - Dimensions.w10,
                      mainAxisSpacing: Dimensions.w10,
                      crossAxisSpacing: Dimensions.h10,
                    ),
                    itemBuilder: (context, index) {
                      var data = varData[index];

                      return InkWell(
                        onTap: () {
                          // var indexData = data.id!.toInt();
                          // var dataIndex = indexData;

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
            } else if (snapshot.hasError) {
              return Center(
                child: Text("${snapshot.error.toString()}"),
              );
            }
            return BuildLoadingAllProducts(itemCount: 20);
          });
    });
  }

  Widget buildElectronicsProducts() {
    return GetBuilder<HomeController>(builder: (allProducts) {
      var listData = allProducts.getAllElectronicsData();
      return FutureBuilder<List<AllProductsModel>>(
          future: listData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<AllProductsModel> varData = snapshot.data!;
              return Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.w10,
                ),
                margin: EdgeInsets.only(
                  top: Dimensions.h20,
                ),
                child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: varData.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: Dimensions.w30 * 8 - Dimensions.w10,
                      mainAxisSpacing: Dimensions.w10,
                      crossAxisSpacing: Dimensions.h10,
                    ),
                    itemBuilder: (context, index) {
                      var data = varData[index];

                      return InkWell(
                        onTap: () {
                          var indexData = data.id!.toInt();
                          var dataIndex = indexData - 1;

                          Get.toNamed(
                            AppPages.getDetailsPage(dataIndex, "home"),
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
            } else if (snapshot.hasError) {
              return Center(
                child: Text("${snapshot.error.toString()}"),
              );
            }
            return BuildLoadingAllProducts(itemCount: 20);
          });
    });
  }

  Widget buildJeweleryProducts() {
    return GetBuilder<HomeController>(builder: (allProducts) {
      var listData = allProducts.getJeweleryProducts();
      return FutureBuilder<List<AllProductsModel>>(
          future: listData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<AllProductsModel> varData = snapshot.data!;
              return Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.w10,
                ),
                margin: EdgeInsets.only(
                  top: Dimensions.h20,
                ),
                child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: varData.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: Dimensions.w30 * 8 - Dimensions.w10,
                      mainAxisSpacing: Dimensions.w10,
                      crossAxisSpacing: Dimensions.h10,
                    ),
                    itemBuilder: (context, index) {
                      var data = varData[index];

                      return InkWell(
                        onTap: () {
                          var indexData = data.id!.toInt();
                          var dataIndex = indexData - 1;

                          Get.toNamed(
                            AppPages.getDetailsPage(dataIndex, "home"),
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
            } else if (snapshot.hasError) {
              return Center(
                child: Text("${snapshot.error.toString()}"),
              );
            }
            return BuildLoadingAllProducts(itemCount: 20);
          });
    });
  }

  Widget buildMensClothingProducts() {
    return GetBuilder<HomeController>(builder: (allProducts) {
      var listData = allProducts.getMensClothingProducts();
      return FutureBuilder<List<AllProductsModel>>(
          future: listData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<AllProductsModel> varData = snapshot.data!;
              return Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.w10,
                ),
                margin: EdgeInsets.only(
                  top: Dimensions.h20,
                ),
                child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: varData.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: Dimensions.w30 * 8 - Dimensions.w10,
                      mainAxisSpacing: Dimensions.w10,
                      crossAxisSpacing: Dimensions.h10,
                    ),
                    itemBuilder: (context, index) {
                      var data = varData[index];

                      return InkWell(
                        onTap: () {
                          // print("home to details $index");
                          print(data.title);

                          var indexData = data.id!.toInt();
                          var dataIndex = indexData - 1;
                          print(dataIndex);

                          Get.toNamed(
                            AppPages.getDetailsPage(dataIndex, "home"),
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
            } else if (snapshot.hasError) {
              return Center(
                child: Text("${snapshot.error.toString()}"),
              );
            }
            return BuildLoadingAllProducts(itemCount: 20);
          });
    });
  }

  Widget buildWomensClothingProducts() {
    return GetBuilder<HomeController>(builder: (allProducts) {
      var listData = allProducts.getWomensClothingProducts();
      return FutureBuilder<List<AllProductsModel>>(
          future: listData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<AllProductsModel> varData = snapshot.data!;
              return Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.w10,
                ),
                margin: EdgeInsets.only(
                  top: Dimensions.h20,
                ),
                child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: varData.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: Dimensions.w30 * 8 - Dimensions.w10,
                      mainAxisSpacing: Dimensions.w10,
                      crossAxisSpacing: Dimensions.h10,
                    ),
                    itemBuilder: (context, index) {
                      var data = varData[index];

                      return InkWell(
                        onTap: () {
                          // print("home to details $index");
                          print(data.title);

                          var indexData = data.id!.toInt();
                          var dataIndex = indexData - 1;
                          print(dataIndex);

                          Get.toNamed(
                            AppPages.getDetailsPage(dataIndex, "home"),
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
            } else if (snapshot.hasError) {
              return Center(
                child: Text("${snapshot.error.toString()}"),
              );
            }
            return BuildLoadingAllProducts(itemCount: 20);
          });
    });
  }
}


 // return FutureBuilder<List<AllProductsModel>>(
      //     future: listData,
      //     builder: ((context, snapshot) {
      //       if (snapshot.hasData) {
      //         List<AllProductsModel> data = snapshot.data!;
      //         return ListView.builder(
      //             itemCount: data.length,
      //             itemBuilder: (context, index) {
      //               return Text("${data[index].title}");
      //             });
      //       } else {
      //         return Center(
      //           child: CircularProgressIndicator(),
      //         );
      //       }
      //       // return Text("ERROR");
      //     }));
      // if (allProducts.dataLoading.isTrue) {
      //   return BuildLoadingAllProducts(itemCount: 20);
      // } else {
      // return FutureBuilder(
      //     future: listData,
      //     builder: (context, snapshot) {
      //       return Container(
      //         padding: EdgeInsets.symmetric(
      //           horizontal: Dimensions.w10,
      //         ),
      //         margin: EdgeInsets.only(
      //           top: Dimensions.h20,
      //         ),
      //         child: GridView.builder(
      //             shrinkWrap: true,
      //             itemCount: allProducts.allProductList.length,
      //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //               crossAxisCount: 2,
      //               mainAxisExtent: Dimensions.w30 * 8 - Dimensions.w10,
      //               mainAxisSpacing: Dimensions.w10,
      //               crossAxisSpacing: Dimensions.h10,
      //             ),
      //             itemBuilder: (context, index) {
      //               // print(listData);
      //               var data = allProducts.allProductList[index];

      //               return InkWell(
      //                 onTap: () {
      //                   print("home to details $index");

      //                   // Get.toNamed(
      //                   //   AppPages.getDetailsPage(dataIndex, "home"),
      //                   // );
      //                   Future.delayed(Duration.zero, () async {
      //                     if (allProducts.allProductList.length != 0 &&
      //                         allProducts.getAllProducts() != null) {
      //                       await Get.toNamed(
      //                         AppPages.getDetailsPage(index, "home"),
      //                       );
      //                       print(allProducts.allProductList.length);
      //                       print("id ${index}");
      //                     } else {
      //                       Get.dialog(Center(
      //                         child: CircularProgressIndicator(),
      //                       ));
      //                       await Future.delayed(
      //                         Duration(seconds: 1),
      //                         () async {
      //                           if (allProducts.allProductList.length != 0 &&
      //                               allProducts.getAllProducts() != null) {
      //                             Get.toNamed(
      //                               AppPages.getDetailsPage(index, "home"),
      //                             );
      //                             print("id loading ${index}");
      //                           } else {
      //                             Get.defaultDialog(title: "WRONG");
      //                             await Future.delayed(
      //                                 Duration.zero, () => Get.back());
      //                             Get.back();
      //                           }
      //                         },
      //                       );
      //                     }
      //                   });
      //                 },
      //                 child: Card(
      //                   elevation: 1.5,
      //                   child: Padding(
      //                     padding: EdgeInsets.symmetric(
      //                       horizontal: Dimensions.w10,
      //                       vertical: Dimensions.h10,
      //                     ),
      //                     child: Column(
      //                       children: [
      //                         Container(
      //                           height: Dimensions.h10 * 10,
      //                           decoration: BoxDecoration(
      //                             image: DecorationImage(
      //                               image: NetworkImage("${data.image}"),
      //                             ),
      //                           ),
      //                         ),
      //                         SizedBox(
      //                           height: 8,
      //                         ),
      //                         Expanded(
      //                           child: Text(
      //                             "${data.title}",
      //                             overflow: TextOverflow.ellipsis,
      //                             style: subTitleStyle.copyWith(
      //                               color: Colors.black,
      //                               fontWeight: FontWeight.w500,
      //                             ),
      //                             maxLines: 2,
      //                           ),
      //                         ),
      //                         Expanded(
      //                           child: Text(
      //                             "\$ ${data.price}",
      //                             overflow: TextOverflow.ellipsis,
      //                             style: subTitleStyle.copyWith(
      //                               color: Colors.black,
      //                               fontWeight: FontWeight.w500,
      //                             ),
      //                             maxLines: 2,
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //               );
      //             }),
      //       );
      //     });
      // }