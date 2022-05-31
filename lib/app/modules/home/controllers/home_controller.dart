import 'package:get/get.dart';

class HomeController extends GetxController {
  var _selectedIndex = 0.obs;
  int get selectedIndex => _selectedIndex.value;

  void selectedTabBar(int index) {
    _selectedIndex.value = index;
  }
}
