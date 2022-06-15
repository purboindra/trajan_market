import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trajan_market/app/controller/auth_controller.dart';

import 'package:trajan_market/app/modules/cart/controllers/cart_controller.dart';
import 'package:trajan_market/app/modules/details/controllers/details_controller.dart';

import 'package:trajan_market/app/helper/dependencies.dart' as dependencies;
import 'package:trajan_market/app/modules/home/controllers/home_controller.dart';
import 'package:trajan_market/app/modules/sign_in/controllers/sign_in_controller.dart';

import 'package:trajan_market/app/modules/sign_up/controllers/sign_up_controller.dart';

import 'package:trajan_market/app/widgets/error_screen.dart';
import 'package:trajan_market/app/widgets/loading_screen.dart';
import 'package:trajan_market/app/widgets/splash_screen.dart';

import 'firebase_options.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await dependencies.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final cartC = Get.find<CartController>().getCartData();
  final detailsC = Get.find<DetailsController>().getFavouriteData();
  final authController = Get.find<AuthController>();

  final box = GetStorage();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<SignInController>();
    Get.find<SignUpController>();
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();

    Get.put(SignInController());
    Get.put(SignUpController());
    Get.put(HomeController());

    return FutureBuilder(
      future: _initialization,
      builder: ((context, snapshot) {
        if (snapshot.hasError) {
          return ErrorScreen();
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return FutureBuilder(
            future: Future.delayed(Duration(seconds: 3)),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Obx(
                  () => GetMaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: "Trajan_Market",
                    initialRoute: authController.isSkipIntro.isTrue
                        ? authController.isAuth.isTrue
                            ? AppPages.getInitial()
                            : Routes.SIGN_IN
                        : Routes.INTRODUCTION,
                    getPages: AppPages.routes,
                  ),
                );
              }
              return FutureBuilder(
                future: authController.firstInitialized(),
                builder: ((context, snapshot) => SplashsScreen()),
              );
            }),
          );
        }
        return LoadingScreen();
      }),
    );
  }
}
