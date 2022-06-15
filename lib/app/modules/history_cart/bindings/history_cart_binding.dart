import 'package:get/get.dart';

import '../controllers/history_cart_controller.dart';

class HistoryCartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryCartController>(
      () => HistoryCartController(),
    );
  }
}
