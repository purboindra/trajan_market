import 'dart:convert';

import 'package:get/get.dart';
import 'package:trajan_market/app/model/all_products_model.dart';
import 'package:trajan_market/app/services/app_constant.dart';
import 'package:http/http.dart' as http;

class WomensController extends GetxController {
  var dataLoading = false.obs;
  Products? products;

  Future getWomensClothing() async {
    dataLoading(true);
    try {
      var url = Uri.parse(AppConstant.GET_WOMENS_PRODUCTS);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var result = json.decode(response.body);

        products = Products.fromJson(result);
      }
    } catch (e) {
      print(e.toString());
    } finally {
      dataLoading(false);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getWomensClothing();
  }
}
