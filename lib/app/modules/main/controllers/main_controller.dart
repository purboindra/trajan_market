import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trajan_market/app/controller/all_products_controller.dart';
import 'package:trajan_market/app/modules/home/views/home_view.dart';
import 'package:trajan_market/app/modules/main/views/main_view.dart';

class MainController extends GetxController {
  var _selectedTabBar = 0.obs;
  RxInt get selectedTabBar => _selectedTabBar;

  final List<Widget> page = [
    HomeView().buildAllProducts(),
    HomeView().buildEelectronics(),
    HomeView().buildJewelery(),
    HomeView().buildMensClothing(),
    HomeView().buildWomensClothing(),
  ];

  void onTapNav(int index) {
    _selectedTabBar.value = index;
  }
}
