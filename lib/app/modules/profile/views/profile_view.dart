import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trajan_market/app/model/user_model.dart';
import 'package:trajan_market/app/modules/cart/controllers/cart_controller.dart';
import 'package:trajan_market/app/modules/main/controllers/main_controller.dart';
import 'package:trajan_market/app/routes/app_pages.dart';
import 'package:trajan_market/app/services/app_constant.dart';
import 'package:trajan_market/app/services/dimensions.dart';
import 'package:trajan_market/app/services/theme.dart';
import 'package:trajan_market/app/widgets/profile_icon_widget.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  int? pageId;
  String? page;

  ProfileView({
    this.pageId = 0,
    this.page = 'profile',
  });
  @override
  Widget build(BuildContext context) {
    // (AppConstant.SIGN_UP_USER);
    Get.put(ProfileController());

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        titleTextStyle: titleStyle.copyWith(
          color: Colors.black,
        ),
        title: Text(
          "My Profile",
        ),
        actions: [
          InkWell(
            onTap: () {
              if (pageId != null) {
                Get.toNamed(AppPages.getCartPage(pageId!, page!));
              } else {
                print("ERROR $pageId and page $page");
              }
            },
            child: Container(
              margin: EdgeInsets.only(
                right: Dimensions.w30,
              ),
              child: GetBuilder<CartController>(builder: (cartC) {
                return cartC.getItems.length != 0
                    ? Badge(
                        padding: EdgeInsets.all(
                          Dimensions.w10,
                        ),
                        badgeContent: Text(
                          "${cartC.getItems.length}",
                          style: titleStyle.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        child: Container(
                          margin: EdgeInsets.only(
                            right: Dimensions.w10,
                            top: Dimensions.h15,
                          ),
                          child: Icon(
                            CupertinoIcons.shopping_cart,
                            size: Dimensions.w30,
                            color: Colors.black,
                          ),
                        ),
                      )
                    : Container(
                        margin: EdgeInsets.only(
                          right: Dimensions.w10,
                          top: Dimensions.h15,
                        ),
                        child: Icon(
                          CupertinoIcons.shopping_cart,
                          size: Dimensions.w30,
                          color: Colors.black,
                        ),
                      );
              }),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.w20 + 5),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GetBuilder<MainController>(builder: (mainC) {
                      return mainC.dataUser.value.photoUrl == null
                          ? ClipOval(
                              child: Container(
                                width: Dimensions.w30 * 2.2,
                                height: Dimensions.h30 * 2.2,
                                decoration: BoxDecoration(
                                  color: greyColor,
                                ),
                                child: Center(
                                  child: Icon(
                                    CupertinoIcons.person,
                                    size: Dimensions.w30 * 1.7,
                                    color: Colors.grey.shade200,
                                  ),
                                ),
                              ),
                            )
                          : ClipOval(
                              child: Container(
                                width: Dimensions.w30 * 2.2,
                                height: Dimensions.h30 * 2.2,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/casual.jpeg"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                    }),
                    // ClipOval(
                    //   child: Container(
                    //     width: Dimensions.w30 * 2.2,
                    //     height: Dimensions.h30 * 2.2,
                    //     decoration: BoxDecoration(
                    //       image: DecorationImage(
                    //         image: AssetImage("assets/casual.jpeg"),
                    //         fit: BoxFit.cover,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      width: Dimensions.w15,
                    ),
                    GetBuilder<MainController>(builder: (mainC) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            mainC.dataUser.value.firstName != null
                                ? "${mainC.dataUser.value.firstName}"
                                : "",
                            style: subHeadingStyle.copyWith(
                              color: Colors.black,
                            ),
                          ),
                          mainC.dataUser.value.address != null
                              ? Row(
                                  children: [
                                    Text(
                                      "Office",
                                      style: titleStyle.copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      width: Dimensions.w5,
                                    ),
                                    Icon(
                                      CupertinoIcons.chevron_down,
                                      color: Colors.black,
                                      size: Dimensions.w20 - 2,
                                    ),
                                  ],
                                )
                              : InkWell(
                                  onTap: () {},
                                  child: Row(
                                    children: [
                                      Text(
                                        "Please add your address",
                                        style: titleStyle.copyWith(
                                          color: Colors.red,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                        ],
                      );
                    }),
                  ],
                ),
                SizedBox(
                  height: Dimensions.h20,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      Dimensions.w20 - 2,
                    ),
                  ),
                  elevation: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.w15,
                      vertical: Dimensions.h20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "Your Points",
                                style: subTitleStyle.copyWith(
                                  color: greyColor,
                                ),
                              ),
                              SizedBox(
                                height: Dimensions.h10,
                              ),
                              Text(
                                "\$ 0",
                                style: titleStyle.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 1,
                          height: Dimensions.h30,
                          color: darkHeader,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "Your Saldo",
                                style: subTitleStyle.copyWith(
                                  color: greyColor,
                                ),
                              ),
                              SizedBox(
                                height: Dimensions.h10,
                              ),
                              Text(
                                "\$ 0",
                                style: titleStyle.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimensions.h20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProfileIconWidget(
                      name: "Edit Profile",
                      icon: CupertinoIcons.pen,
                    ),
                    Container(
                      width: Dimensions.w30,
                      height: Dimensions.h30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: darkHeader,
                      ),
                      child: Center(
                        child: Icon(
                          CupertinoIcons.chevron_right,
                          color: backgroundColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Dimensions.h20,
                ),
                ProfileIconWidget(
                  name: "Settings",
                  icon: CupertinoIcons.settings,
                ),
                SizedBox(
                  height: Dimensions.h20,
                ),
                InkWell(
                  onTap: () {
                    controller.signOut();
                  },
                  child: ProfileIconWidget(
                    name: "Sign Out",
                    icon: CupertinoIcons.arrow_counterclockwise,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
