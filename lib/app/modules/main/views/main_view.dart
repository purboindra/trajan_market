import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:trajan_market/app/controller/all_products_controller.dart';
import 'package:trajan_market/app/services/dimensions.dart';
import 'package:trajan_market/app/services/theme.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    Get.find<AllProductsController>().getAllProducts();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: Dimensions.w30 + 6,
            ),
            color: Colors.black,
          ),
          SizedBox(
            width: Dimensions.w20,
          ),
        ],
        elevation: 0,
        leadingWidth: 70,
        backgroundColor: backgroundColor,
        leading: Container(
          // width: 20,
          margin: EdgeInsets.only(
            top: 10,
            left: 20,
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/logo.png"),
            ),
          ),
        ),
      ),
      body: Obx(
        () => ContainedTabBarView(
          tabBarProperties: TabBarProperties(
            indicatorWeight: 3,
            indicatorColor: Colors.black,
            labelPadding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            isScrollable: true,
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
          ),
          tabs: [
            Text(
              "All Products",
              style: titleStyle.copyWith(
                fontWeight: FontWeight.w600,
                color: controller.selectedTabBar == 0
                    ? Colors.black
                    : Colors.grey.shade500,
              ),
            ),
            Text(
              "Electronics",
              style: titleStyle.copyWith(
                fontWeight: FontWeight.w600,
                color: controller.selectedTabBar == 1
                    ? Colors.black
                    : Colors.grey.shade500,
              ),
            ),
            Text(
              "Jewelery",
              style: titleStyle.copyWith(
                fontWeight: FontWeight.w600,
                color: controller.selectedTabBar == 2
                    ? Colors.black
                    : Colors.grey.shade500,
              ),
            ),
            Text(
              "Men's clothing",
              style: titleStyle.copyWith(
                fontWeight: FontWeight.w600,
                color: controller.selectedTabBar == 3
                    ? Colors.black
                    : Colors.grey.shade500,
              ),
            ),
            Text(
              "Women's clothing",
              style: titleStyle.copyWith(
                fontWeight: FontWeight.w600,
                color: controller.selectedTabBar == 4
                    ? Colors.black
                    : Colors.grey.shade500,
              ),
            ),
          ],
          views: controller.page,
          onChange: (value) {
            controller.onTapNav(value);
          },
        ),
      ),
    );
  }
}
