import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import 'package:trajan_market/app/model/favourite_model.dart';
import 'package:trajan_market/app/services/app_constant.dart';

class FavouriteRepositories {
  final box = GetStorage();
  List<String> favourite = [];

  void addToFav(List<FavouriteModel> favouriteCart) {
    var time = DateTime.now().toIso8601String();
    favourite = [];
    favouriteCart.forEach((element) {
      element.time = time;
      return favourite.add(jsonEncode(element));
    });
    box.write(AppConstant.ADD_FAVOURITE, favourite);
    removeFav(favouriteCart);
  }

  List<FavouriteModel> getFavouriteList() {
    List<dynamic> favourite = [];
    if (box.read(AppConstant.ADD_FAVOURITE) != null) {
      favourite = box.read(AppConstant.ADD_FAVOURITE);
    }
    List<FavouriteModel> favouriteList = [];
    favourite.forEach((element) {
      favouriteList.add(FavouriteModel.fromJson(jsonDecode(element)));
    });
    return favouriteList;
  }

  void removeFav(List<FavouriteModel> favCart) {
    favCart.forEach((element) {
      favourite.remove(element.id);
    });
  }
}
