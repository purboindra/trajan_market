import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trajan_market/app/data/repositories/favourite_repositories.dart';
import 'package:trajan_market/app/model/all_products_model.dart';
import 'package:trajan_market/app/model/favourite_model.dart';
import 'package:trajan_market/app/modules/cart/controllers/cart_controller.dart';

import 'package:trajan_market/app/services/dimensions.dart';

class DetailsController extends GetxController {
  final FavouriteRepositories favouriteRepositories;

  DetailsController({required this.favouriteRepositories});

  final box = GetStorage();
  var selectedSize = 0.obs;

  var loadingData = true.obs;

  var _quantity = 1.obs;
  int get quantity => _quantity.value;

  var _inCartItems = 0.obs;
  int get inCartItems => _inCartItems.value + _quantity.value;

  late CartController _cartC;

  var _selectedFav = 0.obs;
  RxInt get selectedFav => _selectedFav;

  Map<num, FavouriteModel> favItems = {};

  List<FavouriteModel> storageFavourite = [];

  void chooseFav(AllProductsModel allProductsModel) {
    if (!isSelectFav(allProductsModel).value) {
      favItems.putIfAbsent(allProductsModel.id!, () {
        loadingData.value = true;
        var favQuantity = selectedFav.value + 1;
        Get.rawSnackbar(
          title: "Added",
          message: "${allProductsModel.title} to favourite",
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.w20,
            vertical: Dimensions.w15,
          ),
        );
        return FavouriteModel(
          id: allProductsModel.id,
          title: allProductsModel.title,
          price: allProductsModel.price,
          image: allProductsModel.image,
          isExist: true,
          favourite: true,
          quantity: favQuantity,
          time: DateTime.now().toIso8601String(),
        );
      });
      favouriteRepositories.addToFav(getFavItems);

      loadingData.value = false;
    } else {
      favItems.remove(allProductsModel.id);
      Get.rawSnackbar(
        title: "Delete",
        message: "${allProductsModel.title} from favourite",
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.w20,
          vertical: Dimensions.w15,
        ),
      );
      favouriteRepositories.addToFav(getFavItems);
    }

    update();
  }

  RxBool isSelectFav(AllProductsModel allProductsModel) {
    if (favItems.containsKey(allProductsModel.id)) {
      return true.obs;
    } else {
      return false.obs;
    }
  }

  List<FavouriteModel> get getFavItems {
    return favItems.entries.map((e) {
      return e.value;
    }).toList();
  }

  List<FavouriteModel> getFavouriteData() {
    setFav = favouriteRepositories.getFavouriteList();
    return storageFavourite;
  }

  set setFav(List<FavouriteModel> favouriteItems) {
    storageFavourite = favouriteItems;

    for (int i = 0; i < storageFavourite.length; i++) {
      favItems.putIfAbsent(storageFavourite[i].id!, () => storageFavourite[i]);
    }
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity.value = _quantity.value + 1;
    } else {
      _quantity.value = _quantity.value - 1;
    }

    update();
  }

  Future<void> initProductData(
      CartController cart, AllProductsModel allProductsModel) async {
    _quantity = 0.obs;
    _inCartItems = 0.obs;
    _cartC = cart;
    var exist = false;
    exist = _cartC.existInCart(allProductsModel);

    if (exist) {
      _inCartItems.value = _cartC.getQuantity(allProductsModel);
    }
    update();
  }

  void addProductItem(AllProductsModel allProductsModel) {
    // print("prev ${_cartC.itemsDetails.length}");
    _cartC.addItems(allProductsModel, _quantity.value);
    _quantity = 1.obs;
    // _cartC.items.forEach((key, value) {
    //   print(
    //       " items id is ${value.id} title is ${value.title} and quantitiy is ${value.quantity}");
    // });
    // // print("current ${_cartC.itemsDetails.length}");
    // _cartC.itemsDetails.forEach((key, value) {
    //   print(
    //       " items details id is ${value.id} title is ${value.title} and quantitiy is ${value.quantity}");
    // });

    update();
  }

  int get totalItems {
    return _cartC.totalItems;
  }

  @override
  void dispose() {
    super.dispose();
    DetailsController(favouriteRepositories: Get.find());
  }
}
