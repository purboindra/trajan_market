import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:trajan_market/app/model/main_category_model.dart';
import 'package:trajan_market/app/model/user_model.dart';
import 'package:trajan_market/app/modules/favourite/views/favourite_view.dart';
import 'package:trajan_market/app/modules/history_cart/views/history_cart_view.dart';
import 'package:trajan_market/app/modules/home/controllers/home_controller.dart';
import 'package:trajan_market/app/modules/main/views/main_view.dart';
import 'package:trajan_market/app/modules/profile/views/profile_view.dart';
import 'package:trajan_market/app/modules/sign_up/controllers/sign_up_controller.dart';

class MainController extends GetxController {
  final homeC = Get.put(HomeController());
  var dataLoading = false.obs;

  String? page = Get.parameters["page"];
  var pageId = Get.parameters["pageId"];

  var _selectedIndex = 0.obs;
  int get selectedIndex => _selectedIndex.value;

  User? user = FirebaseAuth.instance.currentUser;
  var dataUser = UserModel().obs;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<BottomNavigationBarItem> navBarsItems() {
    return [
      BottomNavigationBarItem(
        label: "home",
        icon: _selectedIndex.value == 0
            ? Icon(CupertinoIcons.house_fill)
            : Icon(CupertinoIcons.home),
      ),
      BottomNavigationBarItem(
        label: "home",
        icon: _selectedIndex.value == 1
            ? Icon(CupertinoIcons.heart_fill)
            : Icon(CupertinoIcons.heart),
      ),
      BottomNavigationBarItem(
        label: "home",
        icon: _selectedIndex.value == 2
            ? Icon(CupertinoIcons.cart)
            : Icon(CupertinoIcons.cart_fill),
      ),
      BottomNavigationBarItem(
        label: "home",
        icon: _selectedIndex.value == 3
            ? Icon(CupertinoIcons.person_alt_circle_fill)
            : Icon(CupertinoIcons.person_alt_circle),
      ),
    ];
  }

  List<dynamic> pages = [
    MainView().buildMain(),
    FavouriteView(),
    HistoryCartView(),
    ProfileView(),
  ];

  void onTapBottomNav(int index) {
    _selectedIndex.value = index;
  }

  RxList<MainCategoryModel> listOfCategoryMain = [
    MainCategoryModel(
      image: "assets/main_category_books.png",
      title: "Products",
    ),
    MainCategoryModel(
      image: "assets/main_category_fashion_accecoriss.png",
      title: "Fashion Accecoris",
    ),
    MainCategoryModel(
      image: "assets/main_category_fashion.png",
      title: "Fashion",
    ),
    MainCategoryModel(
      image: "assets/main_category_hobbies.png",
      title: "Hobbies",
    ),
    MainCategoryModel(
      image: "assets/main_category_home.png",
      title: "Home",
    ),
    MainCategoryModel(
      image: "assets/main_category_mom_and_baby.png",
      title: "Mom\'s & Baby",
    ),
    MainCategoryModel(
      image: "assets/main_category_skincare.png",
      title: "Skincare",
    ),
    MainCategoryModel(
      image: "assets/main_category_smartphone.png",
      title: "Smartphone",
    ),
    MainCategoryModel(
      image: "assets/main_category_sport_and_outdoor.png",
      title: "Sport & Outdoor",
    ),
    MainCategoryModel(
      image: "assets/main_category_women_shoes.png",
      title: "Women\'s Shoes",
    ),
  ].obs;

  @override
  void dispose() {
    MainController();
    super.dispose();
  }

  @override
  void onReady() {
    super.onReady();
    firestore.collection("users").doc(user!.uid).get().then((value) {
      this.dataUser.value = UserModel.fromJson(value.data()!);
    });
  }
}
