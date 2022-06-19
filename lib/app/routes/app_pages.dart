import 'package:get/get.dart';
import 'package:trajan_market/app/modules/cart/views/cart_view.dart';
import 'package:trajan_market/app/modules/details_history_cart/views/details_history_cart_view.dart';
import 'package:trajan_market/app/modules/favourite/views/favourite_view.dart';
import 'package:trajan_market/app/modules/history_cart/views/history_cart_view.dart';
import 'package:trajan_market/app/modules/introduction/views/introduction_view.dart';
import 'package:trajan_market/app/modules/profile/views/profile_view.dart';
import 'package:trajan_market/app/modules/sign_in/views/sign_in_view.dart';
import 'package:trajan_market/app/modules/sign_up/views/sign_up_view.dart';

import '../modules/details/bindings/details_binding.dart';
import '../modules/details/views/details_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static String getInitial() => "${Routes.MAIN}";

  static String getDetailsPage(int pageId, String page) {
    return "${Routes.DETAILS}?pageId=${pageId}&page=$page";
  }

  static String getCartPage(int pageId, String page) {
    return "${Routes.CART}?pageId=${pageId}&page=$page";
  }

  static String getFavouritePage(int pageId, String page) =>
      "${Routes.FAVOURITE}?pageId=$pageId&page=$page}";

  static String getProfilePage(int pageId, String page) =>
      "${Routes.PROFILE}?pageId=$pageId&page=$page}";

  static String getDetailsCart(int pageId, String page) =>
      "${Routes.DETAILS_HISTORY_CART}?pageId=$pageId&page=$page}";

  static const INITIAL = Routes.MAIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      transition: Transition.topLevel,
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
      transition: Transition.topLevel,
    ),
    GetPage(
      name: _Paths.DETAILS,
      page: () {
        var page = Get.parameters["page"];
        var pageId = Get.parameters["pageId"];
        var parsePageId = int.parse(pageId!);

        return DetailsView(pageId: parsePageId, page: page!);
      },
      binding: DetailsBinding(),
      transition: Transition.topLevel,
    ),
    GetPage(
      name: _Paths.CART,
      page: () {
        var page = Get.parameters["page"];
        var pageId = Get.parameters["pageId"];
        var pageIndex = int.parse(pageId!);
        return CartView(
          page: page!,
          pageId: pageIndex,
        );
      },
      transition: Transition.topLevel,
    ),
    GetPage(
      name: _Paths.FAVOURITE,
      page: () {
        return FavouriteView();
      },
      transition: Transition.topLevel,
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () {
        var page = Get.parameters["page"];
        var pageId = Get.parameters['pageId'];
        var pageIndex = int.parse(pageId!);
        return ProfileView(
          page: page!,
          pageId: pageIndex,
        );
      },
      transition: Transition.topLevel,
    ),
    GetPage(
      name: _Paths.HISTORY_CART,
      page: () => HistoryCartView(),
      transition: Transition.topLevel,
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignUpView(),
      transition: Transition.topLevel,
    ),
    GetPage(
      name: _Paths.SIGN_IN,
      page: () => SignInView(),
      transition: Transition.topLevel,
    ),
    GetPage(
      name: _Paths.INTRODUCTION,
      page: () => IntroductionView(),
      transition: Transition.topLevel,
    ),
    GetPage(
      name: _Paths.DETAILS_HISTORY_CART,
      page: () {
        // var pageId = Get.parameters["pageId"];
        // int index = int.parse(pageId!);
        // var page = Get.parameters["page"];
        return DetailsHistoryCartView(
            // page: page!,
            // pageId: index,
            );
      },
      transition: Transition.topLevel,
    ),
  ];
}
