import 'dart:convert';

import 'package:trajan_market/app/model/cart_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trajan_market/app/services/app_constant.dart';

class CartRepository {
  List<String> cart = [];
  final box = GetStorage();
  List<dynamic> cartHistory = [];

  List<String> cartDetails = [];

  void seeDetailsCart(List<CartModel> detailsCart) {
    var time = DateTime.now().toIso8601String();
    cartDetails = [];
    detailsCart.forEach((element) {
      element.time = time;
      return cartDetails.add(jsonEncode(element));
    });
  }

  void addToCart(List<CartModel> cartList) {
    var time = DateTime.now().toString();
    cart = [];

    //Convert object to String

    cartList.forEach((element) {
      element.time = time;

      return cart.add(jsonEncode(element));
    });

    box.write(AppConstant.CART_LIST, cart);
    // getCartList();
  }

  List<CartModel> getCartList() {
    List<dynamic> carts = [];

    if (box.read(AppConstant.CART_LIST) != null) {
      carts = box.read(AppConstant.CART_LIST);
    }
    List<CartModel> cartList = [];

    carts.forEach((element) {
      cartList.add(CartModel.fromJson(jsonDecode(element)));
    });

    return cartList;
  }

  List<CartModel> getCartHistoryList() {
    if (box.read(AppConstant.CART_HISTORY_LIST) != null) {
      cartHistory = box.read(AppConstant.CART_HISTORY_LIST);
    }
    List<CartModel> cartHistoryList = [];
    cartHistory.forEach((element) {
      cartHistoryList.add(CartModel.fromJson(jsonDecode(element)));
    });

    return cartHistoryList;
  }

  void addToCartHistoryList() {
    if (box.read(AppConstant.CART_HISTORY_LIST) != null) {
      cartHistory = box.read(AppConstant.CART_HISTORY_LIST);
    }
    for (int i = 0; i < cart.length; i++) {
      cartHistory.add(cart[i]);
    }
    checkOutcartItems();
    box.write(AppConstant.CART_HISTORY_LIST, cartHistory);
    for (int p = 0; p < getCartHistoryList().length; p++);
  }

  void checkOutcartItems() {
    cart = [];

    box.remove(AppConstant.CART_LIST);
  }
}
