import 'dart:convert';

import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:trajan_market/app/data/repositories/cart_repositories.dart';
import 'package:trajan_market/app/model/cart_model.dart';
import 'package:trajan_market/app/modules/cart/controllers/cart_controller.dart';
import 'package:trajan_market/app/routes/app_pages.dart';
import 'package:trajan_market/app/services/dimensions.dart';
import 'package:trajan_market/app/services/theme.dart';

import '../controllers/history_cart_controller.dart';

class HistoryCartView extends GetView<HistoryCartController> {
  @override
  Widget build(BuildContext context) {
    var cartHistoryC =
        Get.find<CartController>().getCartHistoryList().reversed.toList();

    Map<String, int> cartItemsPerOrder = Map();

    for (int i = 0; i < cartHistoryC.length; i++) {
      if (cartItemsPerOrder.containsKey(cartHistoryC[i].time)) {
        cartItemsPerOrder.update(cartHistoryC[i].time!, (value) => ++value);
      } else {
        cartItemsPerOrder.putIfAbsent(cartHistoryC[i].time!, () => 1);
      }
    }

    List<String> cartOrderTimeToList() {
      return cartItemsPerOrder.entries.map((e) => e.key).toList();
    }

    List<int> cartItemsPerOrderToList() {
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }

    List<String> itemsPerOrder = cartOrderTimeToList();

    List<int> dateTime = cartItemsPerOrderToList();

    var listCounter = 0;

    Get.find<CartController>().addToDetailsOrder();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        titleTextStyle: titleStyle.copyWith(
          color: Colors.black,
        ),
        title: Text(
          "My History Order",
        ),
        actions: [
          InkWell(
            onTap: () {
              Get.toNamed(AppPages.getCartPage(listCounter, "cartPage"));
            },
            child: Container(
              margin: EdgeInsets.only(
                right: Dimensions.w30,
              ),
              child: GetBuilder<CartController>(builder: (cartC) {
                return cartC.getItems.length != 0
                    ? Badge(
                        padding: EdgeInsets.all(
                          Dimensions.w10,
                        ),
                        badgeContent: Text(
                          "${cartC.getItems.length}",
                          style: titleStyle.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        child: Container(
                          margin: EdgeInsets.only(
                            right: Dimensions.w10,
                            top: Dimensions.h15,
                          ),
                          child: Icon(
                            CupertinoIcons.shopping_cart,
                            size: Dimensions.w30,
                            color: Colors.black,
                          ),
                        ),
                      )
                    : Container(
                        margin: EdgeInsets.only(
                          right: Dimensions.w10,
                          top: Dimensions.h15,
                        ),
                        child: Icon(
                          CupertinoIcons.shopping_cart,
                          size: Dimensions.w30,
                          color: Colors.black,
                        ),
                      );
              }),
            ),
          ),
        ],
      ),
      body: cartHistoryC.length > 0
          ? Container(
              margin: EdgeInsets.symmetric(
                horizontal: Dimensions.w20,
                vertical: Dimensions.h10,
              ),
              child: ListView(
                shrinkWrap: true,
                children: [
                  for (int i = 0; i < dateTime.length; i++)
                    Container(
                      margin: EdgeInsets.only(
                        bottom: Dimensions.h10,
                      ),
                      child: Card(
                        elevation: 0.7,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: Dimensions.h10,
                            horizontal: Dimensions.w10,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.store,
                                        size: Dimensions.w20,
                                      ),
                                      SizedBox(
                                        width: Dimensions.w5,
                                      ),
                                      Text(
                                        "Trajan Store",
                                        style: subTitleStyle.copyWith(
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  (() {
                                    var dateOutput =
                                        DateTime.now().toIso8601String();
                                    if (listCounter < cartHistoryC.length) {
                                      DateTime dateParse = DateFormat(
                                              "yyyy-MM-dd HH:mm:ss")
                                          .parse(
                                              cartHistoryC[listCounter].time!);

                                      var dateInput = DateTime.parse(
                                          dateParse.toIso8601String());
                                      var formatOutput = DateFormat("dd/MM/yy");
                                      dateOutput =
                                          formatOutput.format(dateInput);
                                    }
                                    return RichText(
                                      text: TextSpan(
                                        style:
                                            DefaultTextStyle.of(context).style,
                                        children: [
                                          TextSpan(
                                            text: "${dateOutput}",
                                            style: subTitleStyle.copyWith(
                                              color: darkGrey,
                                            ),
                                          ),
                                          TextSpan(text: "  "),
                                          TextSpan(
                                              text: "Selesai",
                                              style: titleStyle.copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: primaryColor,
                                              )),
                                        ],
                                      ),
                                    );
                                  }()),
                                  // Expanded(
                                  //   child: timeWidget(i),
                                  // ),
                                ],
                              ),
                              SizedBox(
                                height: Dimensions.h10,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Wrap(
                                        // runSpacing: Dimensions.w20,
                                        // spacing: Dimensions.w10,
                                        direction: Axis.horizontal,
                                        children:
                                            List.generate(dateTime[i], (index) {
                                          if (listCounter <
                                              cartHistoryC.length) {
                                            listCounter++;
                                          }
                                          return Container(
                                            margin: EdgeInsets.only(
                                              right: Dimensions.w10,
                                            ),
                                            width: Dimensions.w30 * 2,
                                            height: Dimensions.w30 * 2,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    "${cartHistoryC[listCounter - 1].image}"),
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          );
                                        }),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: Dimensions.w10,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${dateTime[i]} Items",
                                    style: titleStyle.copyWith(
                                      color: Colors.black,
                                    ),
                                  ),
                                  OutlinedButton(
                                    onPressed: () {
                                      Map<num, CartModel> moreOrder = {};

                                      for (int j = 0;
                                          j < cartHistoryC.length;
                                          j++) {
                                        if (cartHistoryC[j].time ==
                                            itemsPerOrder[i]) {
                                          print(cartHistoryC[j].title);
                                          moreOrder.putIfAbsent(
                                            cartHistoryC[j].id!,
                                            () => CartModel.fromJson(
                                              jsonDecode(
                                                jsonEncode(
                                                  cartHistoryC[j],
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                      }

                                      Get.find<CartController>().setDetails =
                                          moreOrder;

                                      Get.find<CartController>()
                                          .addToDetailsOrder();

                                      var page = {"page": "historyCart"};
                                      Get.toNamed(Routes.DETAILS_HISTORY_CART,
                                          parameters: page);
                                    },
                                    style: ButtonStyle(
                                        side: MaterialStateProperty.all(
                                          BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                Dimensions.w15 / 2),
                                          ),
                                        )),
                                    child: Text(
                                      "See Details",
                                      style: subTitleStyle.copyWith(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
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
            ),
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   Get.find<CartController>().removeCartHistory();
      // }),
    );
  }
}
