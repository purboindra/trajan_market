import 'package:get/get.dart';
import 'package:trajan_market/app/controller/all_products_controller.dart';
import 'package:trajan_market/app/controller/electronics_controller.dart';
import 'package:trajan_market/app/controller/jewelery_controller.dart';
import 'package:trajan_market/app/controller/men_clothing_controller.dart';
import 'package:trajan_market/app/controller/women_clothing_controller.dart';
import 'package:trajan_market/app/modules/home/controllers/home_controller.dart';
import 'package:trajan_market/app/modules/main/controllers/main_controller.dart';

Future<void> init() async {
  // Controller
  Get.lazyPut(() => HomeController());
  Get.lazyPut(() => MainController());
  Get.lazyPut(() => AllProductsController());
  Get.lazyPut(() => ElectronicsController());
  Get.lazyPut(() => JeweleryController());
  Get.lazyPut(() => MensClothingController());
  Get.lazyPut(() => WomensController());
}
