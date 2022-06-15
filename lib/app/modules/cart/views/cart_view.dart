import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:trajan_market/app/routes/app_pages.dart';
import 'package:trajan_market/app/services/dimensions.dart';
import 'package:trajan_market/app/services/theme.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  final int pageId;
  final String page;

  CartView({required this.page, required this.pageId});
  @override
  Widget build(BuildContext context) {
    var params = Get.parameters;

    List<String> imagePayment = [
      "assets/logo_paypal.png",
      "assets/logo_amazon_pay.png",
      "assets/logo_pay_point.png",
    ];

    print('from details $params');
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        leading: InkWell(
          onTap: () {
            if (params['page'] == "details") {
              Get.offNamedUntil(
                  AppPages.getDetailsPage(pageId, page), (route) => false);
            } else {
              Get.back();
            }
          },
          child: Icon(
            CupertinoIcons.back,
            size: 24,
            color: Colors.black,
          ),
        ),
        titleSpacing: 100,
        title: Row(
          children: [
            Text(
              "My Cart",
              style: titleStyle.copyWith(
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: Dimensions.w10,
            ),
            Icon(
              Icons.shopping_bag_outlined,
              color: Colors.black,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.w20 + Dimensions.w5,
        ),
        child: SafeArea(
          child: GetBuilder<CartController>(
            builder: (cartC) {
              return Column(
                children: [
                  Expanded(
                    child: cartC.getItems.length != 0
                        ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: cartC.getItems.length,
                            itemBuilder: (BuildContext context, int index) {
                              var data = cartC.getItems[index];
                              print("data id is ${data.id}");
                              return InkWell(
                                onTap: () {
                                  // print("data id ${data.id}");
                                  // print('page id ${pageId}');
                                  var pageIndex = data.id!.toInt();
                                  var dataIndex = pageIndex - 1;
                                  Get.toNamed(
                                    AppPages.getDetailsPage(dataIndex, page),
                                    arguments: data.quantity,
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                    bottom: Dimensions.h10,
                                  ),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    elevation: 0,
                                    color: Color.fromARGB(255, 240, 240, 240),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: Dimensions.w15,
                                        vertical: Dimensions.h15,
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: Dimensions.h30 * 3,
                                            width: Dimensions.w20 * 3,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    "${data.image}"),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: Dimensions.w20,
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${data.title}",
                                                  maxLines: 1,
                                                  style: titleStyle.copyWith(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w700,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: Dimensions.h10 - 3,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "\$ ${data.price}",
                                                      style:
                                                          titleStyle.copyWith(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    Text(
                                                      "${data.quantity} items",
                                                      style:
                                                          titleStyle.copyWith(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: darkHeader,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: Dimensions.h15,
                                                ),
                                                GetBuilder<CartController>(
                                                    builder: (cartC) {
                                                  var allP =
                                                      data.allProductsModel!;

                                                  return Row(
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          cartC.addItems(
                                                              allP, -1);
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
                                                      Text(
                                                        "${cartC.getItems[index].quantity}",
                                                        style:
                                                            titleStyle.copyWith(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: Dimensions.w10,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          cartC.addItems(
                                                              allP, 1);
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
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
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
                                  "Oops.. your cart is empty",
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
                                      Get.offNamed(Routes.HOME);
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
                  ),
                  cartC.getItems.length != 0
                      ? Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.bottomSheet(
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
                                        Text(
                                          "Choose your payment method",
                                          style: titleStyle.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Wrap(
                                          runSpacing: 20,
                                          children: List.generate(
                                            imagePayment.length,
                                            (index) => Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: Dimensions.w15,
                                                vertical: Dimensions.h10,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                border: Border.all(
                                                    color: darkHeader,
                                                    width: 1),
                                              ),
                                              child: Row(
                                                children: [
                                                  InkWell(
                                                      onTap: () {
                                                        cartC.changeSelectIndex(
                                                            index);
                                                      },
                                                      child: Obx(
                                                        () => Container(
                                                          padding:
                                                              EdgeInsets.all(5),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100),
                                                            border: Border.all(
                                                              style: BorderStyle
                                                                  .solid,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                          width: Dimensions.w30,
                                                          height:
                                                              Dimensions.w30,
                                                          child: controller
                                                                      .selectIndexPayment ==
                                                                  index
                                                              ? ClipOval(
                                                                  child:
                                                                      Container(
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                )
                                                              : SizedBox(),
                                                        ),
                                                      )),
                                                  SizedBox(
                                                    width: Dimensions.w30,
                                                  ),
                                                  Container(
                                                    width: Dimensions.w30 * 4,
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                            imagePayment[
                                                                index]),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Payment method",
                                      style: titleStyle.copyWith(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.grey.shade900,
                                      ),
                                    ),
                                    Obx(() => Image.asset(
                                          imagePayment[
                                              cartC.selectIndexPayment],
                                          width: Dimensions.w30 * 4,
                                          fit: BoxFit.cover,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: Dimensions.h10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Sub Total",
                                  style: subTitleStyle.copyWith(
                                    color: Colors.grey.shade900,
                                  ),
                                ),
                                Text(
                                  "\$ ${controller.totalAmount}",
                                  style: titleStyle.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      : SizedBox(),
                  SizedBox(
                    height: Dimensions.h20,
                  ),
                  GetBuilder<CartController>(builder: (cartC) {
                    return cartC.getItems.length != 0
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    primary: Colors.black,
                                    padding: EdgeInsets.all(
                                      Dimensions.w20,
                                    ),
                                  ),
                                  onPressed: () async {
                                    Get.dialog(Center(
                                      child: CircularProgressIndicator(),
                                    ));
                                    await Future.delayed(
                                      Duration(seconds: 2),
                                      () => Get.back(),
                                    );
                                    controller.addToHistoryCart();
                                  },
                                  child: Text(
                                    "CheckOut",
                                    style: titleStyle.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : SizedBox();
                  }),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
