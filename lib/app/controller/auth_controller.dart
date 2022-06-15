import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';
import 'package:trajan_market/app/model/user_model.dart';

import 'package:trajan_market/app/services/app_constant.dart';

class AuthController extends GetxController {
  var isSkipIntro = false.obs;
  var isAuth = false.obs;

  final box = GetStorage();

  FirebaseAuth auth = FirebaseAuth.instance;

  var userModel = UserModel();

  Future<void> firstInitialized() async {
    try {
      await autoLogin();

      if (box.read(AppConstant.SKIP_INTRO) != null) {
        isSkipIntro.value = true;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future autoLogin() async {
    try {
      if (box.read(AppConstant.SIGN_IN_USER) != null ||
          box.read(AppConstant.SIGN_UP_USER) != null) {
        isAuth.value = true;
      } else {
        isAuth.value = false;
      }
    } catch (e) {
      print("ERROR ${e.toString()}");
      isAuth.value = false;
    }
  }
}
