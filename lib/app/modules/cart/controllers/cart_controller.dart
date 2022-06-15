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

  List<CartModel> cartStorage = [];

  void changeSelectIndex(int index) {
    _selectIndexPayment.value = index;
  }

  num get totalAmount {
    var total = 0.0.obs;
    _items.forEach((key, value) {
      total.value += value.quantity! * value.price!;
    });

    return total.value;
  }

  void addItems(AllProductsModel allProductsModel, int quantity) {
    var totalQuantity = 0.obs;
    if (_items.containsKey(allProductsModel.id)) {
      // print("items constainkey ${allProductsModel.id}");
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
          time: DateTime.now().toIso8601String(),
          allProductsModel: allProductsModel,
        );
      });
      if (totalQuantity <= 0) {
        _items.remove(allProductsModel.id);
        var indexItems = allProductsModel.id!.toInt() - 1;
        Get.rawSnackbar(
            message: "Delete ${allProductsModel.id} from cart",
            onTap: (getSnackBar) {
              print('from cart c ${indexItems}');
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
            allProductsModel: allProductsModel,
          );
        });
      } else {
        print("WRONG");
      }
    }
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
          // print("get quantity ${quantity.value} and value ${value.quantity}");
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
        cartModel[i].id!,
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
    // print("prev ${_items.length}");
    _items = {};
    _items = setItems;
    // print("current ${_items.length}");
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
    box.remove(AppConstant.CART_HISTORY_LIST);
    update();
  }
}
