import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:trajan_market/app/modules/details/controllers/details_controller.dart';
import 'package:trajan_market/app/modules/home/controllers/home_controller.dart';
import 'package:trajan_market/app/routes/app_pages.dart';
import 'package:trajan_market/app/services/dimensions.dart';
import 'package:trajan_market/app/services/theme.dart';

import '../controllers/favourite_controller.dart';

class FavouriteView extends GetView<FavouriteController> {
  final homeC = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    // Future.delayed(Duration.zero, () async {
    //   await Get.find<HomeController>();
    //   await Get.find<DetailsController>();

    //   await Get.find<FavouriteController>();
    // });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        titleTextStyle: titleStyle.copyWith(
          color: Colors.black,
        ),
        title: Text(
          "My Favourite",
        ),
        actions: [
          Obx(() => Container(
                margin: EdgeInsets.only(
                  right: Dimensions.w20,
                ),
                child: InkWell(
                  onTap: () {
                    controller.buildItem();
                  },
                  child: Icon(
                    controller.changeItem.isTrue
                        ? CupertinoIcons.list_bullet
                        : CupertinoIcons.square_grid_2x2,
                    color: Colors.black,
                  ),
                ),
              )),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.w20,
        ),
        child: Container(
          margin: EdgeInsets.only(
            top: Dimensions.h20,
          ),
          child: GetBuilder<DetailsController>(builder: (detailsC) {
            Get.find<HomeController>();
            return detailsC.getFavItems.length != 0
                ? Obx(
                    () => controller.changeItem.isTrue
                        ? _buildGrid(detailsC)
                        : _buildList(detailsC),
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: Dimensions.h20 * 10,
                          child: Image.asset(
                            "assets/empty_favourite.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.h10,
                        ),
                        Text(
                          "Oops.. you have nothing here",
                          style: titleStyle.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.h20,
                        ),
                        Container(
                          width: Dimensions.w20 * 15,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: EdgeInsets.all(
                                Dimensions.w15,
                              ),
                            ),
                            onPressed: () {
                              // Get.offNamed(AppPages.getInitial());
                            },
                            child: Text(
                              "Start Shopping",
                              style: titleStyle.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
          }),
        ),
      ),
    );
  }

  ListView _buildList(DetailsController detailsC) {
    Get.find<HomeController>();
    return ListView.builder(
        reverse: true,
        shrinkWrap: true,
        itemCount: detailsC.getFavItems.length,
        itemBuilder: (context, index) {
          var _dataFav = detailsC.getFavItems[index];
          return InkWell(
            onTap: () {
              var dataFav = _dataFav.id!.toInt();
              var favData = dataFav - 1;
              Future.delayed(Duration.zero, () async {
                if (Get.find<HomeController>().allProductList.length != 0 &&
                    Get.find<HomeController>().getAllProducts() != null) {
                  Get.toNamed(
                    AppPages.getDetailsPage(favData, "favourite"),
                  );
                } else {
                  Get.dialog(Center(
                    child: CircularProgressIndicator(),
                  ));
                  await Future.delayed(
                    Duration(seconds: 1),
                    () async {
                      if (Get.find<HomeController>().allProductList.length !=
                              0 &&
                          Get.find<HomeController>().getAllProducts() != 0) {
                        Get.toNamed(
                          AppPages.getDetailsPage(favData, "favourite"),
                        );
                      } else {
                        Get.defaultDialog(title: "WRONG");
                        await Future.delayed(Duration.zero, () => Get.back());
                        Get.back();
                      }
                    },
                  );
                }
              });
            },
            child: Card(
              elevation: 1.5,
              child: Container(
                margin: EdgeInsets.only(
                  bottom: Dimensions.h10,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.w10,
                  vertical: Dimensions.h10,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: Dimensions.h10 * 8,
                      width: Dimensions.w10 * 8,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage("${_dataFav.image}"))),
                    ),
                    SizedBox(
                      width: Dimensions.w15,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${_dataFav.title}",
                            style: subTitleStyle.copyWith(
                              color: Colors.black,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: Dimensions.h5,
                          ),
                          Text(
                            "\$ ${_dataFav.price}",
                            style: subTitleStyle.copyWith(
                              color: Colors.grey.shade600,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  GridView _buildGrid(DetailsController detailsC) {
    Get.find<HomeController>();
    return GridView.builder(
      shrinkWrap: true,
      itemCount: detailsC.getFavItems.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: Dimensions.w30 * 6,
        mainAxisSpacing: Dimensions.w10,
        crossAxisSpacing: Dimensions.h10,
      ),
      itemBuilder: (context, index) {
        var _dataFav = detailsC.getFavItems[index];
        return InkWell(
          onTap: () {
            var dataFav = _dataFav.id!.toInt();
            var favData = dataFav - 1;
            Future.delayed(Duration.zero, () async {
              if (Get.find<HomeController>().allProductList.length != 0 &&
                  Get.find<HomeController>().getAllProducts() != 0) {
                Get.toNamed(
                  AppPages.getDetailsPage(favData, "favourite"),
                );
              } else {
                Get.dialog(Center(
                  child: CircularProgressIndicator(),
                ));
                await Future.delayed(
                  Duration(seconds: 1),
                  () async {
                    if (Get.find<HomeController>().allProductList.length != 0 &&
                        Get.find<HomeController>().getAllProducts() != null) {
                      Get.toNamed(
                        AppPages.getDetailsPage(favData, "favourite"),
                      );
                    } else {
                      Get.defaultDialog(title: "WRONG");
                      await Future.delayed(Duration.zero, () => Get.back());
                      Get.back();
                    }
                  },
                );
              }
            });
          },
          child: Card(
            elevation: 1.5,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.w5,
                vertical: Dimensions.h5,
              ),
              child: Column(
                children: [
                  Container(
                    height: Dimensions.h10 * 8,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage("${_dataFav.image}"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "\$ ${_dataFav.price}",
                    overflow: TextOverflow.ellipsis,
                    style: subTitleStyle.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 2,
                  ),
                  Expanded(
                    child: Text(
                      "${_dataFav.title}",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: subTitleStyle.copyWith(
                        color: Colors.grey.shade600,
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
      },
    );
  }
}
