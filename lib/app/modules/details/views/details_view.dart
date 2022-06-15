import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:trajan_market/app/modules/cart/controllers/cart_controller.dart';
import 'package:trajan_market/app/modules/favourite/controllers/favourite_controller.dart';

import 'package:trajan_market/app/modules/home/controllers/home_controller.dart';
import 'package:trajan_market/app/routes/app_pages.dart';
import 'package:trajan_market/app/services/dimensions.dart';
import 'package:trajan_market/app/services/theme.dart';
import 'package:trajan_market/app/widgets/expandable_text.dart';

import '../controllers/details_controller.dart';

class DetailsView extends GetView<DetailsController> {
  final int pageId;
  final String page;
  DetailsView({required this.pageId, required this.page});

  @override
  Widget build(BuildContext context) {
    var params = Get.parameters;
    print(params);
    var arguments = Get.arguments;
    print("from cart view $arguments");
    Get.put(HomeController());
    List<String> size = [
      "S",
      "M",
      "L",
      "XL",
      "XXL",
    ];

    var data = Get.find<HomeController>().allProductList[pageId];
    print("from details ${data.id}");
    var index = data.id!.toInt();
    print("index $index");
    // if (Get.find<CartController>().getItems[pageId] != null) {
    // print(
    //     "quantity from cart view ${Get.find<CartController>().getItems[index].quantity}");
    // print(
    //     "id from cart view ${Get.find<CartController>().getItems[index].id} and tittle ${Get.find<CartController>().getItems[pageId].id} ");
    // }

    Get.find<HomeController>();

    Future.delayed(Duration.zero, () async {
      await Get.find<DetailsController>()
          .initProductData(Get.find<CartController>(), data);
      await Get.find<DetailsController>();
      await Get.find<CartController>();
      await Get.find<FavouriteController>();
    });

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        toolbarHeight: Dimensions.h30 * 2 + Dimensions.h5,
        leading: InkWell(
          onTap: () {
            if (params["page"] == "favourite") {
              Get.offNamedUntil(Routes.MAIN, (route) => false);
            } else {
              if (params["page"] == "details") {
                Get.back();
              } else if (params["page"] == "home") {
                Get.back();
                // Get.offNamed(
                //   AppPages.getCartPage(pageId, page),
                // );
              } else {
                Get.offNamed(Routes.HOME);
              }
            }
          },
          child: Icon(
            CupertinoIcons.chevron_back,
            color: Colors.black,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              controller.chooseFav(data);
            },
            child: GetBuilder<DetailsController>(builder: (detailsC) {
              return detailsC.isSelectFav(data).isTrue
                  ? Container(
                      margin: EdgeInsets.only(
                        top: 10,
                      ),
                      child: Icon(
                        Icons.favorite,
                        color: Colors.black,
                        size: Dimensions.w30,
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.only(
                        // right: Dimensions.w30,
                        top: 10,
                      ),
                      child: Icon(
                        Icons.favorite_outline,
                        color: Colors.black,
                        size: Dimensions.w30,
                      ),
                    );
            }),
          ),
          SizedBox(
            width: Dimensions.w15,
          ),
          InkWell(
            onTap: () {
              Get.toNamed(AppPages.getCartPage(pageId, page));
            },
            child: GetBuilder<CartController>(builder: (cartC) {
              return cartC.getItems.length != 0
                  ? Container(
                      margin: EdgeInsets.only(
                        right: Dimensions.w30,
                        top: 10,
                      ),
                      child: Badge(
                        padding: EdgeInsets.all(
                          Dimensions.w10,
                        ),
                        badgeContent: Text(
                          "${cartC.getItems.length}",
                          style: titleStyle.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.black,
                          size: Dimensions.w30,
                        ),
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.only(
                        right: Dimensions.w30,
                        top: 10,
                      ),
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.black,
                        size: Dimensions.w30,
                      ),
                    );
            }),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.w20 + Dimensions.w5,
        ),
        child: Container(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "${data.title}",
                  textAlign: TextAlign.center,
                  style: titleStyle.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: Dimensions.h5,
                ),
                Text(
                  "\$ ${data.price}",
                  textAlign: TextAlign.center,
                  style: titleStyle.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: Dimensions.h20,
                  ),
                  width: Dimensions.w30 * 10 - Dimensions.w10 * 10,
                  height: Dimensions.w30 * 10 - Dimensions.w20 * 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: CachedNetworkImage(
                    // width: Get.width,
                    imageUrl: "${data.image!}",
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        image: DecorationImage(
                          image: imageProvider,
                          // fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    placeholder: (context, url) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                SizedBox(
                  height: Dimensions.h10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Dimensions.h10,
                    ),
                    Text(
                      "Description",
                      style: titleStyle.copyWith(color: Colors.black),
                    ),
                    SizedBox(
                      height: Dimensions.h5,
                    ),
                    ExpandableTextWidget(
                      text: "${data.description}",
                    ),
                  ],
                ),
                SizedBox(
                  height: Dimensions.h20,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.w20 + Dimensions.w5,
          vertical: Dimensions.h30,
        ),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "\$ ${data.price}",
              style: titleStyle.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              width: Dimensions.w30,
            ),
            GetBuilder<CartController>(builder: (cartC) {
              return Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    padding: EdgeInsets.all(Dimensions.h20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.w15,
                              vertical: Dimensions.h20,
                            ),
                            child: Container(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: Dimensions.h20 * 5,
                                        height: Dimensions.h20 * 6,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image:
                                                NetworkImage("${data.image}"),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: Dimensions.w20,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "\$ ${data.price}",
                                            style: subHeadingStyle.copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          SizedBox(
                                            height: Dimensions.h10,
                                          ),
                                          GetBuilder<DetailsController>(
                                              builder: (detailsC) {
                                            return Row(
                                              children: [
                                                detailsC.inCartItems == 0
                                                    ? Container(
                                                        width: Dimensions.w30 +
                                                            Dimensions.w5,
                                                        height: Dimensions.w30 +
                                                            Dimensions.w5,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                            color: Colors
                                                                .grey.shade400,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        child: Center(
                                                          child: Icon(
                                                            Icons.remove,
                                                            color: Colors
                                                                .grey.shade400,
                                                          ),
                                                        ),
                                                      )
                                                    : InkWell(
                                                        onTap: () {
                                                          detailsC.setQuantity(
                                                              false);
                                                        },
                                                        child: Container(
                                                          width:
                                                              Dimensions.w30 +
                                                                  Dimensions.w5,
                                                          height:
                                                              Dimensions.w30 +
                                                                  Dimensions.w5,
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          child: Center(
                                                            child: Icon(
                                                              Icons.remove,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                SizedBox(
                                                  width: Dimensions.w10,
                                                ),
                                                Obx(
                                                  () => RichText(
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          style: titleStyle
                                                              .copyWith(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                          text:
                                                              "${controller.inCartItems}",
                                                        ),
                                                        TextSpan(
                                                          text: "  ",
                                                        ),
                                                        TextSpan(
                                                          style: titleStyle
                                                              .copyWith(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    27,
                                                                    27,
                                                                    27),
                                                          ),
                                                          text: "Items",
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: Dimensions.w10,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    detailsC.setQuantity(true);
                                                    print(detailsC.quantity);
                                                  },
                                                  child: Container(
                                                    width: Dimensions.w30 +
                                                        Dimensions.w5,
                                                    height: Dimensions.w30 +
                                                        Dimensions.w5,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: Colors.black,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    child: Center(
                                                      child: Icon(
                                                        Icons.add,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          }),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: Dimensions.h20,
                                  ),
                                  data.category != "electronics" &&
                                          data.category != "jewelery"
                                      ? Text(
                                          "Select Size",
                                          style: titleStyle.copyWith(
                                            color: Colors.black,
                                          ),
                                        )
                                      : SizedBox(),
                                  data.category != "electronics" &&
                                          data.category != "jewelery"
                                      ? Obx(
                                          () => Container(
                                            // color: Colors.yellow,
                                            child: Wrap(
                                              children: List.generate(
                                                  size.length, (index) {
                                                return InkWell(
                                                  onTap: () {
                                                    controller.selectedSize
                                                        .value = index;
                                                  },
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                      right: Dimensions.w10,
                                                      top: Dimensions.h10,
                                                    ),
                                                    width: Dimensions.w30 +
                                                        Dimensions.w20,
                                                    height: Dimensions.w30 +
                                                        Dimensions.w20,
                                                    decoration: BoxDecoration(
                                                      color: controller
                                                                  .selectedSize
                                                                  .value ==
                                                              index
                                                          ? Colors.black
                                                          : backgroundColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      border: Border.all(
                                                        color: darkHeader,
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        "${size[index]}",
                                                        style:
                                                            titleStyle.copyWith(
                                                          color: controller
                                                                      .selectedSize
                                                                      .value ==
                                                                  index
                                                              ? Colors.white
                                                              : Colors.black,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                            ),
                                          ),
                                        )
                                      : SizedBox(),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                      vertical: Dimensions.h20,
                                      horizontal: Dimensions.w10,
                                    ),
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              padding: EdgeInsets.all(
                                                Dimensions.w20,
                                              ),
                                              primary: Colors.black,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                            ),
                                            onPressed: () async {
                                              controller.addProductItem(data);
                                              Get.defaultDialog(
                                                title: "Success add to cart",
                                                content: Container(
                                                  width: Dimensions.w30 * 3,
                                                  height: Dimensions.h30 * 3,
                                                  color: Colors.green.shade200,
                                                  child: Icon(
                                                    Icons.check,
                                                    color: Colors.grey.shade300,
                                                    size: Dimensions.h30 +
                                                        Dimensions.h15,
                                                  ),
                                                ),
                                              );
                                              await Future.delayed(
                                                  Duration(milliseconds: 700),
                                                  () => Get.back());

                                              Get.back();
                                            },
                                            child: Text(
                                              "Add To Cart",
                                              style: titleStyle.copyWith(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    size: 32,
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
