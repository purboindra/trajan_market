import 'package:get/get.dart';

class FavouriteController extends GetxController {
  var changeItem = false.obs;

  void buildItem() {
    if (changeItem.isFalse) {
      print("item list");
      changeItem.value = true;
    } else {
      print("item grid");
      changeItem.value = false;
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
