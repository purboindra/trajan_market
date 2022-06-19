import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trajan_market/app/routes/app_pages.dart';
import 'package:trajan_market/app/services/app_constant.dart';

class SignInController extends GetxController {
  final _auth = FirebaseAuth.instance;
  var formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var loading = false.obs;

  final box = GetStorage();

  var remember = false.obs;
  var obsecureText = true.obs;

  void rememberMe(bool value) {
    remember.value = value;
  }

  void signInUser(String email, password) async {
    loading.value = true;
    if (formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((uid) {
        box.write(AppConstant.SKIP_INTRO, true);
        loading.value = false;

        Get.offNamedUntil(AppPages.getInitial(), (route) => false);
      }).catchError((e) {
        loading.value = false;
        Get.rawSnackbar(
          duration: Duration(
            seconds: 4,
          ),
          message: "Oops.. something wrong ${e.toString()}",
          snackPosition: SnackPosition.TOP,
        );
      });
      loading.value = false;
    }
  }
}
