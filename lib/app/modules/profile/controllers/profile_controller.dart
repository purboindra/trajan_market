import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trajan_market/app/model/user_model.dart';
import 'package:trajan_market/app/routes/app_pages.dart';
import 'package:trajan_market/app/services/app_constant.dart';

class ProfileController extends GetxController {
  User? user = FirebaseAuth.instance.currentUser;
  var dataUser = UserModel().obs;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signOut() async {
    await auth.signOut();
    final box = GetStorage();
    box.remove(AppConstant.SIGN_IN_USER);
    box.remove(AppConstant.SIGN_UP_USER);

    Get.offNamedUntil(Routes.SIGN_IN, (route) => false);
  }
}
