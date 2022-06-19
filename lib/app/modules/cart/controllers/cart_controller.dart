import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trajan_market/app/data/repositories/cart_repositories.dart';
import 'package:trajan_market/app/model/all_products_model.dart';
import 'package:trajan_market/app/model/cart_model.dart';
import 'package:trajan_market/app/routes/app_pages.dart';
import 'package:trajan_market/app/services/app_constant.dart';

class CartController extends GetxController {
  final CartRepository cartRepository;
  CartController({required this.cartRepository});

  var _selectIndexPayment = 0.obs;
  int get selectIndexPayment => _selectIndexPayment.value;

  var loading = false.obs;

  final box = GetStorage();

  var _quantity = 1.obs;
  int get quantity => _quantity.value;

  var _inCartItems = 0.obs;
  int get inCartItems => _inCartItems.value;

  Map<num, CartModel> _items = {};
  Map<num, CartModel> get items => _items;

  Map<num, CartModel> itemsDetails = {};

  List<CartModel> cartStorage = [];

  List<CartModel> cartDetails = [];

  void changeSelectIndex(int index) {
    _selectIndexPayment.value = index;
  }

  num get costOrder {
    var cost = 0.0.obs;
    cost.value = subTotalAmount / 11;

    return cost.value.toPrecision(1);
  }

  num get totalAmountDetails {
    var total = 0.0.obs;
    total.value = costOrder + subTotalAmount.toDouble();
    return total.value.toPrecision(2);
  }

  num get subTotalAmount {
    var total = 0.0.obs;
    itemsDetails.forEach((key, value) {
      total.value += value.quantity! * value.price!;
    });
    return total.value.toPrecision(2);
  }

  num get totalAmount {
    var total = 0.0.obs;
    _items.forEach((key, value) {
      total.value += value.quantity! * value.price!;
    });

    return total.value.toPrecision(2);
  }

  void addItems(AllProductsModel allProductsModel, int quantity) {
    var totalQuantity = 0.obs;
    if (_items.containsKey(allProductsModel.id)) {
      _items.update(allProductsModel.id!, (value) {
        totalQuantity.value = value.quantity! + quantity;

        return CartModel(
          id: value.id,
          title: value.title,
          price: value.price,
          description: value.description,
          category: value.category,
          image: value.image,
          isExist: true,
          quantity: quantity + value.quantity!,
          paymentMethod: _selectIndexPayment.value,
          time: DateTime.now().toIso8601String(),
          allProductsModel: allProductsModel,
        );
      });

      if (totalQuantity <= 0) {
        _items.remove(allProductsModel.id);

        var indexItems = allProductsModel.id!.toInt() - 1;
        Get.rawSnackbar(
            message: "Delete ${allProductsModel.title} from cart",
            onTap: (getSnackBar) {
              Get.toNamed(AppPages.getDetailsPage(indexItems, "details"));
            });
      }
    } else {
      if (quantity > 0) {
        _items.putIfAbsent(allProductsModel.id!, () {
          print(
              "adding items put if absent ${allProductsModel.id} and quantitiy is $quantity");
          return CartModel(
            id: allProductsModel.id,
            title: allProductsModel.title,
            price: allProductsModel.price,
            description: allProductsModel.description,
            category: allProductsModel.category,
            image: allProductsModel.image,
            isExist: true,
            quantity: quantity,
            time: DateTime.now().toIso8601String(),
            paymentMethod: _selectIndexPayment.value,
            allProductsModel: allProductsModel,
          );
        });
      } else {
        print("WRONG");
      }
    }
    cartRepository.seeDetailsCart(getDetailsItemsCart);
    cartRepository.addToCart(getItems);
    update();
  }

  bool existInCart(AllProductsModel allProductsModel) {
    if (_items.containsKey(allProductsModel.id)) {
      return true;
    } else {
      return false;
    }
  }

  int getQuantity(AllProductsModel allProductsModel) {
    var quantity = 0.obs;
    if (_items.containsKey(allProductsModel.id)) {
      _items.forEach((key, value) {
        if (key == allProductsModel.id) {
          quantity.value = value.quantity!;
        }
      });
    }
    return quantity.value;
  }

  List<CartModel> getCartData() {
    setCart = cartRepository.getCartList();

    return cartStorage;
  }

  set setCart(List<CartModel> cartModel) {
    cartStorage = cartModel;
    for (int i = 0; i < cartModel.length; i++) {
      _items.putIfAbsent(
        cartStorage[i].id!,
        () {
          return cartStorage[i];
        },
      );
    }
  }

  List<CartModel> get getItems {
    return _items.entries.map((e) {
      return e.value;
    }).toList();
  }

  int get totalItems {
    var totalQuantity = 0.obs;
    _items.forEach((key, value) {
      totalQuantity.value = totalQuantity.value + value.quantity!;
    });
    return totalQuantity.value;
  }

  List<CartModel> getCartHistoryList() {
    return cartRepository.getCartHistoryList();
  }

  set setItems(Map<num, CartModel> setItems) {
    _items = {};
    _items = setItems;
  }

  set setDetails(Map<num, CartModel> setDetails) {
    itemsDetails = {};
    itemsDetails = setDetails;
  }

  List<CartModel> get getDetailsItemsCart {
    return itemsDetails.entries.map((e) {
      return e.value;
    }).toList();
  }

  void addToDetailsOrder() {
    cartRepository.seeDetailsCart(getDetailsItemsCart);
    update();
  }

  void addToCartList() {
    cartRepository.addToCart(getItems);

    update();
  }

  void addToHistoryCart() {
    loading.value == true;
    Future.delayed(
      Duration(seconds: 2),
      () => cartRepository.addToCartHistoryList(),
    );
    checkOutCart();
    loading.value == false;
    ;
  }

  void checkOutCart() {
    _items.clear();
    update();
  }

  void removeCartHistory() {
    _items.clear();
    print(_items.length);
    box.remove(AppConstant.CART_HISTORY_LIST);
    update();
  }
}
