import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:trajan_market/app/data/repositories/cart_repositories.dart';
import 'package:trajan_market/app/model/all_products_model.dart';
import 'package:trajan_market/app/model/cart_model.dart';
import 'package:trajan_market/app/modules/cart/controllers/cart_controller.dart';
import 'package:trajan_market/app/modules/details/controllers/details_controller.dart';
import 'package:trajan_market/app/modules/history_cart/controllers/history_cart_controller.dart';
import 'package:trajan_market/app/modules/history_cart/views/history_cart_view.dart';
import 'package:trajan_market/app/modules/home/controllers/home_controller.dart';
import 'package:trajan_market/app/routes/app_pages.dart';
import 'package:trajan_market/app/services/dimensions.dart';
import 'package:trajan_market/app/services/theme.dart';
import 'package:trajan_market/app/widgets/expandable_text.dart';

import '../controllers/details_history_cart_controller.dart';

class DetailsHistoryCartView extends GetView<DetailsHistoryCartController> {
  // final int pageId;
  // final String page;

  // DetailsHistoryCartView({required this.page, required this.pageId});

  @override
  Widget build(BuildContext context) {
    var futureData = Get.find<HomeController>().getAllData();

    var params = Get.parameters;

    var cartHistoryC =
        Get.find<CartController>().getCartHistoryList().reversed.toList();

    final cartC = Get.find<CartController>();

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
      // return cartItemsPerOrder.entries.map((e) => e.key).toList();
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }

    List<String> itemsPerOrder = cartOrderTimeToList();

    List<int> dateTime = cartItemsPerOrderToList();

    var listCounter = 0;
    // // final cartC = Get.find<CartController>();

    // Map<num, CartModel> moreOrder = {};

    // for (int i = 0; i < dateTime.length; i++)
    //   for (int j = 0; j < cartHistoryC.length; j++) {
    //     if (cartHistoryC[j].time == itemsPerOrder[i]) {
    //       moreOrder.putIfAbsent(
    //         cartHistoryC[j].id!,
    //         () => CartModel.fromJson(
    //           jsonDecode(
    //             jsonEncode(
    //               cartHistoryC[j],
    //             ),
    //           ),
    //         ),
    //       );
    //     }
    //   }
    // var cartRepo = CartRepository();

    // cartRepo.seeDetailsCart(cartHistoryC);
    // print(cartHistoryC[listCounter - 1].title);

    // Get.find<CartController>().setItems = moreOrder;
    // print(moreOrder);
    // print(cartHistoryC.length);
    // print(moreOrder.length);
    // Get.find<CartController>().setDetails = moreOrder;
    // print(moreOrder);
    // Get.find<CartController>().addToCartList();

    cartC.getDetailsItemsCart;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        leading: InkWell(
          onTap: () {
            if (params['page'] == "historyCart") {
              Get.back();
            }
          },
          child: Icon(
            CupertinoIcons.back,
            size: 24,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Details Order",
          style: titleStyle.copyWith(
            color: Colors.black,
          ),
        ),
      ),
      body: FutureBuilder<List<AllProductsModel>>(
          future: futureData,
          builder: (context, snapshot) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.w20,
                vertical: Dimensions.h20,
              ),
              child: ListView(
                // shrinkWrap: true,

                children: [
                  // for (int i = 0; i < dateTime.length; i++)
                  Container(
                    // height: Dimensions.h30 * 4,
                    // color: Colors.green,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          // color: Colors.red,
                          child: Row(
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
                                style: titleStyle.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        (() {
                          var dateOutput = DateTime.now().toIso8601String();
                          if (listCounter < cartHistoryC.length) {
                            DateTime dateParse =
                                DateFormat("yyyy-MM-dd HH:mm:ss")
                                    .parse(cartHistoryC[listCounter].time!);

                            var dateInput =
                                DateTime.parse(dateParse.toIso8601String());
                            var formatOutput = DateFormat("dd/MM/yy");
                            dateOutput = formatOutput.format(dateInput);
                          }
                          return Container(
                            // color: Colors.blue,
                            child: RichText(
                              text: TextSpan(
                                style: titleStyle.copyWith(),
                                children: [
                                  TextSpan(
                                    text: "${dateOutput}",
                                    style: subTitleStyle.copyWith(
                                      color: darkGrey,
                                    ),
                                  ),
                                  TextSpan(
                                      text: "  ", style: titleStyle.copyWith()),
                                  TextSpan(
                                      text: "Done",
                                      style: titleStyle.copyWith(
                                        fontWeight: FontWeight.w700,
                                        color: primaryColor,
                                      )),
                                ],
                              ),
                            ),
                          );
                        }()),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.h20,
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: cartC.getDetailsItemsCart.length,
                    itemBuilder: (context, index) {
                      var data = cartC.getDetailsItemsCart[index];

                      return InkWell(
                        onTap: () {
                          var dataId = data.id!.toInt();
                          var index = dataId - 1;
                          print(index); // Get.toNamed(
                          Get.bottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(Dimensions.w20),
                                topRight: Radius.circular(Dimensions.w20),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.w20,
                                vertical: Dimensions.h30,
                              ),
                              margin: EdgeInsets.only(
                                bottom: Dimensions.h30,
                              ),
                              child: Wrap(
                                runSpacing: 20,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.network(
                                        "${data.image}",
                                        width: Dimensions.w30 * 2,
                                      ),
                                      SizedBox(
                                        width: Dimensions.w15,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              "${data.title}",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: titleStyle.copyWith(
                                                  color: Colors.black),
                                            ),
                                            SizedBox(
                                              height: Dimensions.h5,
                                            ),
                                            ExpandableTextWidget(
                                              text: "${data.description}",
                                            ),
                                            SizedBox(height: Dimensions.h30),
                                            OutlinedButton(
                                              style: ButtonStyle(
                                                  side:
                                                      MaterialStateProperty.all(
                                                    BorderSide(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  shape:
                                                      MaterialStateProperty.all(
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              Dimensions.w15 /
                                                                  2),
                                                    ),
                                                  )),
                                              onPressed: () {
                                                Get.toNamed(
                                                  AppPages.getDetailsPage(
                                                      index, "detailsOrder"),
                                                );
                                              },
                                              child: Text(
                                                "View Products",
                                                style: subTitleStyle.copyWith(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                          //   AppPages.getDetailsPage(index, "detailsOrder"),
                          // );
                        },
                        child: Card(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.w15,
                              vertical: Dimensions.h10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.network(
                                  "${data.image}",
                                  width: Dimensions.w30 * 2,
                                ),
                                SizedBox(
                                  width: Dimensions.w10,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${data.title}",
                                        maxLines: 1,
                                        style: titleStyle.copyWith(
                                          fontWeight: FontWeight.w600,
                                          overflow: TextOverflow.ellipsis,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        height: Dimensions.h10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(),
                                          Text(
                                            "${data.quantity} Items",
                                            style: subTitleStyle.copyWith(
                                              color: darkGrey,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: Dimensions.h10,
                                      ),
                                      Row(
                                        children: [
                                          Spacer(),
                                          Text(
                                            "\$ ${data.price}",
                                            style: titleStyle.copyWith(
                                                fontWeight: FontWeight.w500,
                                                overflow: TextOverflow.ellipsis,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: Dimensions.h10,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: Dimensions.h10,
                  ),
                  Divider(
                    thickness: 1,
                    color: lightGrey,
                  ),
                  SizedBox(
                    height: Dimensions.h10,
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Order Info",
                        style: titleStyle.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.h20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Sub Total",
                            style: subTitleStyle.copyWith(
                              color: darkGrey,
                            ),
                          ),
                          Text(
                            "\$ ${Get.find<CartController>().subTotalAmount}",
                            style: titleStyle.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Dimensions.h10 - 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Cost Order",
                            style: subTitleStyle.copyWith(
                              color: darkGrey,
                            ),
                          ),
                          Text(
                            "\$ ${Get.find<CartController>().costOrder}",
                            style: titleStyle.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Dimensions.h10 - 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Total",
                            style: subTitleStyle.copyWith(
                              color: darkGrey,
                            ),
                          ),
                          Text(
                            "\$ ${Get.find<CartController>().totalAmountDetails}",
                            style: titleStyle.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
