import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:trajan_market/app/modules/cart/controllers/cart_controller.dart';
import 'package:trajan_market/app/services/dimensions.dart';
import 'package:trajan_market/app/services/theme.dart';

import '../controllers/history_cart_controller.dart';

class HistoryCartView extends GetView<HistoryCartController> {
  @override
  Widget build(BuildContext context) {
    // var cartRepo = CartRepository();
    var cartHistoryC = Get.find<CartController>().getCartHistoryList();

    Map<String, int> cartItemsPerOrder = Map();

    for (int i = 0; i < cartHistoryC.length; i++) {
      if (cartItemsPerOrder.containsKey(cartHistoryC[i].time)) {
        cartItemsPerOrder.update(cartHistoryC[i].time!, (value) => ++value);
      } else {
        cartItemsPerOrder.putIfAbsent(cartHistoryC[i].time!, () => 1);
      }
    }

    List<int> getCartItemsPerOrderList() {
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }

    List<String> cartOrderTimeToList() {
      return cartItemsPerOrder.entries.map((e) => e.key).toList();
    }

    var itemsPerOrder = getCartItemsPerOrderList();

    // var dateTime = cartOrderTimeToList();

    var listCounter = 0;

    // Widget timeWidget(int index) {
    //   var dateOutput = DateTime.now().toIso8601String();
    //   if (index < cartHistoryC.length) {
    //     DateTime dateParse =
    //         DateFormat("yyyy-MM-dd HH:mmm").parse(dateTime[index]);

    //     var dateInput = DateTime.parse(dateParse.toIso8601String());
    //     var formatOutput = DateFormat("MM dd yyyy hh:mm");
    //     dateOutput = formatOutput.format(dateInput);
    //   }
    //   return RichText(
    //     text: TextSpan(
    //       style: DefaultTextStyle.of(context).style,
    //       children: [
    //         TextSpan(
    //           text: "${dateOutput}",
    //           style: titleStyle.copyWith(
    //             color: darkGrey,
    //           ),
    //         ),
    //         TextSpan(text: "  "),
    //         TextSpan(
    //             text: "Selesai",
    //             style: subTitleStyle.copyWith(
    //               fontWeight: FontWeight.w500,
    //               color: primaryColor,
    //             )),
    //       ],
    //     ),
    //   );
    // }

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
              // if (pageId != null) {
              //   Get.toNamed(AppPages.getCartPage(pageId!, page!));
              // } else {
              //   print("ERROR $pageId and page $page");
              // }
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
                  for (int i = 0; i < itemsPerOrder.length; i++)
                    Container(
                      margin: EdgeInsets.only(
                        bottom: Dimensions.h10,
                      ),
                      child: Card(
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
                                children: [
                                  Icon(
                                    Icons.store,
                                    size: Dimensions.w30,
                                  ),
                                  SizedBox(
                                    width: Dimensions.w5,
                                  ),
                                  Text(
                                    "Trajan Store",
                                    style: titleStyle.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: Dimensions.h10,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: SingleChildScrollView(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Wrap(
                                            direction: Axis.horizontal,
                                            children: List.generate(
                                                itemsPerOrder[i], (index) {
                                              if (listCounter <
                                                  cartHistoryC.length) {
                                                listCounter++;
                                              }
                                              return Container(
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                        right: Dimensions.w10,
                                                      ),
                                                      width: 50,
                                                      height: 60,
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                              image: NetworkImage(
                                                                  "${cartHistoryC[listCounter - 1].image}"))),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }),
                                          ),
                                          SizedBox(
                                            width: Dimensions.w10,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "${cartHistoryC[listCounter - 1].title}",
                                    style: subTitleStyle.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: darkGrey,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                    height: Dimensions.h5,
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
              child: Text("NOTHING"),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}
