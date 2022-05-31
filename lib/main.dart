import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:trajan_market/app/modules/main/views/main_view.dart';
import 'package:trajan_market/app/helper/dependencies.dart' as dependencies;

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependencies.init();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      // initialRoute: AppPages.INITIAL,
      home: MainView(),
      getPages: AppPages.routes,
    ),
  );
}
