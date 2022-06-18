import 'package:get/get.dart';

import '../controllers/details_history_cart_controller.dart';

class DetailsHistoryCartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsHistoryCartController>(
      () => DetailsHistoryCartController(),
    );
  }
}
