import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trajan_market/app/model/all_products_model.dart';

import 'package:trajan_market/app/modules/home/views/home_view.dart';
import 'package:trajan_market/app/services/app_constant.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  var dataLoading = false.obs;
  var error = false.obs;

  List<AllProductsModel> _allProductList = [];
  List<AllProductsModel> get allProductList => _allProductList;

  List<AllProductsModel> _electronicsProducts = [];
  List<AllProductsModel> get electronicsProducts => _electronicsProducts;

  List<AllProductsModel> _jeweleryProducts = [];
  List<AllProductsModel> get jeweleryProducts => _jeweleryProducts;

  List<AllProductsModel> _mensClothingProducts = [];
  List<AllProductsModel> get mensClothingProducts => _mensClothingProducts;

  List<AllProductsModel> _womensClothingProducts = [];
  List<AllProductsModel> get womensClothingProducts => _womensClothingProducts;

  Future<List<AllProductsModel>> getAllData() async {
    var url = Uri.parse(AppConstant.BASE_URL + AppConstant.GET_ALL_PRODUCTS);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);

      update();
      return jsonResponse.map((e) => AllProductsModel.fromJson(e)).toList();
    } else {
      throw Exception("Oops.. something wrong");
    }
  }

  Future<List<AllProductsModel>> getAllElectronicsData() async {
    var url = Uri.parse(AppConstant.GET_ELECTRONICS_PRODUCTS);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);

      update();
      return jsonResponse.map((e) => AllProductsModel.fromJson(e)).toList();
    } else {
      throw Exception("Oops.. something wrong");
    }
  }

  Future<List<AllProductsModel>> getJeweleryProducts() async {
    var url = Uri.parse(AppConstant.GET_JEWELERY_PRODUCTS);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);

      update();
      return jsonResponse.map((e) => AllProductsModel.fromJson(e)).toList();
    } else {
      throw Exception("Oops.. something wrong");
    }
  }

  Future<List<AllProductsModel>> getMensClothingProducts() async {
    var url = Uri.parse(AppConstant.GET_MENS_PRODUCTS);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);

      update();
      return jsonResponse.map((e) => AllProductsModel.fromJson(e)).toList();
    } else {
      throw Exception("Oops.. something wrong");
    }
  }

  Future<List<AllProductsModel>> getWomensClothingProducts() async {
    var url = Uri.parse(AppConstant.GET_WOMENS_PRODUCTS);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);

      update();
      return jsonResponse.map((e) => AllProductsModel.fromJson(e)).toList();
    } else {
      throw Exception("Oops.. something wrong");
    }
  }

  final List<Widget> page = [
    HomeView().buildAllProducts(),
    HomeView().buildElectronicsProducts(),
    HomeView().buildJeweleryProducts(),
    HomeView().buildMensClothingProducts(),
    HomeView().buildWomensClothingProducts(),
  ];

  @override
  void onInit() {
    super.onInit();
    getAllData();

    getAllElectronicsData();
    getJeweleryProducts();
    getMensClothingProducts();
    getWomensClothingProducts();
  }
}



  // Future<void> getAllProducts() async {
  //   try {
  //     dataLoading.value = true;

  //     var url = Uri.parse(AppConstant.BASE_URL + AppConstant.GET_ALL_PRODUCTS);
  //     var response = await http.get(url);

  //     // if (response.statusCode == 200) {
  //     String responseBody = response.body;
  //     var jsonBody = json.decode(responseBody);
  //     for (var json in jsonBody) {
  //       _allProductList.add(AllProductsModel(
  //         id: json['id'],
  //         title: json['title'],
  //         price: json['price'],
  //         description: json['description'],
  //         category: json['category'],
  //         image: json['image'],
  //         rating: json['rating'] != null
  //             ? new Rating.fromJson(json['rating'])
  //             : null,
  //       ));
  //     }
  //     // }

  //     dataLoading.value = false;
  //     update();
  //   } catch (e) {
  //     dataLoading.value = false;

  //     print(e.toString());
  //   } finally {
  //     dataLoading.value = false;
  //   }
  // }
