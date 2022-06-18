import 'package:get/get.dart';
import 'package:trajan_market/app/controller/auth_controller.dart';

import 'package:trajan_market/app/data/api/api_client.dart';
import 'package:trajan_market/app/data/repositories/all_products_repo.dart';
import 'package:trajan_market/app/data/repositories/cart_repositories.dart';
import 'package:trajan_market/app/data/repositories/favourite_repositories.dart';
import 'package:trajan_market/app/modules/cart/controllers/cart_controller.dart';
import 'package:trajan_market/app/modules/details/controllers/details_controller.dart';
import 'package:trajan_market/app/modules/details_history_cart/controllers/details_history_cart_controller.dart';
import 'package:trajan_market/app/modules/favourite/controllers/favourite_controller.dart';
import 'package:trajan_market/app/modules/home/controllers/home_controller.dart';
import 'package:trajan_market/app/modules/introduction/controllers/introduction_controller.dart';
import 'package:trajan_market/app/modules/main/controllers/main_controller.dart';
import 'package:trajan_market/app/modules/profile/controllers/profile_controller.dart';
import 'package:trajan_market/app/modules/sign_in/controllers/sign_in_controller.dart';
import 'package:trajan_market/app/modules/sign_up/controllers/sign_up_controller.dart';
import 'package:trajan_market/app/services/app_constant.dart';

Future<void> init() async {
  // Controller
  Get.lazyPut(() => HomeController());
  Get.lazyPut(() => MainController());
  Get.lazyPut(() => CartController(cartRepository: Get.find()));
  Get.lazyPut(() => DetailsController(favouriteRepositories: Get.find()));
  Get.lazyPut(() => FavouriteController());
  Get.lazyPut(() => ProfileController());
  Get.lazyPut(() => SignUpController());
  Get.lazyPut(() => SignInController());
  Get.lazyPut(() => IntroductionController());
  Get.lazyPut(() => AuthController());
  Get.lazyPut(() => DetailsHistoryCartController());

  //Repositories
  Get.lazyPut(() => AllProductRepository(apiClient: Get.find()));
  Get.lazyPut(() => CartRepository());
  Get.lazyPut(() => FavouriteRepositories());

  //AppConstant
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstant.BASE_URL));
}
