import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trajan_market/app/model/user_model.dart';
import 'package:trajan_market/app/routes/app_pages.dart';
import 'package:trajan_market/app/services/app_constant.dart';

class SignUpController extends GetxController {
  var termsAndCondition = false.obs;
  var obsecureText = true.obs;

  var userModel = UserModel();

  final box = GetStorage();

  var loading = false.obs;
  var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Map<String, UserModel> userS = {};

  void onChangeCheckBox(bool value) {
    termsAndCondition.value = value;
  }

  void createUser(String email, String password) async {
    loading.value = true;

    if (formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        postDataUser();
        box.write(AppConstant.SKIP_INTRO, true);
      }).catchError((e) {
        loading.value = false;
        Get.rawSnackbar(message: "Sorry, something wrong ${e.toString()}");
      });
    }

    Get.offNamedUntil(AppPages.getInitial(), (route) => false);

    loading.value = false;
  }

  postDataUser() async {
    User? user = _auth.currentUser;
    loading.value = true;

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameController.text;
    userModel.lastName = lastNameController.text;
    userModel.password = passwordController.text;

    loading.value = false;

    firestore.collection("users").doc(user.uid).set(
          userModel.toJson(),
        );

    box.write(AppConstant.SIGN_UP_USER, userModel);

    loading.value = false;
  }
}
