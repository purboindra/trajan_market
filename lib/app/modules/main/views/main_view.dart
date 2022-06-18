import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trajan_market/app/data/repositories/cart_repositories.dart';

import 'package:trajan_market/app/modules/cart/controllers/cart_controller.dart';
import 'package:trajan_market/app/modules/details/controllers/details_controller.dart';
import 'package:trajan_market/app/modules/favourite/controllers/favourite_controller.dart';
import 'package:trajan_market/app/modules/home/controllers/home_controller.dart';
import 'package:trajan_market/app/modules/sign_in/controllers/sign_in_controller.dart';
import 'package:trajan_market/app/modules/sign_up/controllers/sign_up_controller.dart';
import 'package:trajan_market/app/routes/app_pages.dart';

import 'package:trajan_market/app/services/dimensions.dart';
import 'package:trajan_market/app/services/theme.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  List<String> nameCategory = [
    "Fashion",
    "Home",
    "Skincare",
    "Smartphone",
    "Fashion Accecoris",
    "Mom\'s & Baby",
    "Women\'s Shoes",
    "Healthy",
    "Hobbies",
    "Books",
    "Sport & Outdoor",
  ];
  final box = GetStorage();
  Map<String, dynamic> _user = {};

  // final mainC = Get.find<MainController>();
  // final mainC = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    Get.put(MainController());
    Future.delayed(Duration.zero, () async {
      await Get.put(DetailsController(favouriteRepositories: Get.find()));
      await Get.put(CartController(cartRepository: Get.find()));
      await Get.put(CartRepository());
      await Get.put(FavouriteController());
      await Get.put(SignInController());
      await Get.put(SignUpController());

      // await Get.put(HomeController());
    });
    return Scaffold(
      body: Obx(
        () => controller.pages[controller.selectedIndex],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.selectedIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedItemColor: greyColor,
          selectedItemColor: darkGrey,
          onTap: (value) {
            controller.onTapBottomNav(value);
          },
          items: controller.navBarsItems(),
        ),
      ),
    );
  }

  Widget buildMain() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.w20 + 5,
        ),
        child: Column(
          children: [
            //Header
            Container(
              margin: EdgeInsets.only(
                  // top: Dimensions.h30 + Dimensions.h30,
                  ),
              child: Row(
                children: [
                  ClipOval(
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
                  ),
                  SizedBox(
                    width: Dimensions.h15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(
                        () => controller.dataUser.value.firstName != null
                            ? Text(
                                '${controller.dataUser.value.firstName}',
                                style: subHeadingStyle.copyWith(
                                  color: Colors.black,
                                ),
                              )
                            : Text("Login first"),
                      ),
                      SizedBox(
                        height: Dimensions.h5,
                      ),
                      Row(
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
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Dimensions.h20,
            ),
            //banner
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: false,
                viewportFraction: 0.9,
                autoPlayInterval: Duration(
                  seconds: 5,
                ),
                height: Dimensions.h30 * 4,
              ),
              items: [1, 2, 3, 4].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: Get.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            'Your banner here $i',
                            style: titleStyle.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ));
                  },
                );
              }).toList(),
            ),

            SizedBox(
              height: Dimensions.h20,
            ),

            //body
            Obx(() => Expanded(
                  child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: Dimensions.h10,
                          mainAxisSpacing: Dimensions.w10,
                          mainAxisExtent: Dimensions.h30 * 4,
                          crossAxisCount: 3),
                      itemCount: controller.listOfCategoryMain.length,
                      itemBuilder: (context, index) {
                        var data = controller.listOfCategoryMain[index];

                        return InkWell(
                          onTap: () {
                            Get.toNamed(Routes.HOME);
                          },
                          child: Card(
                            elevation: 3,
                            child: Padding(
                              padding: EdgeInsets.all(
                                Dimensions.h10,
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "${data.title}",
                                      maxLines: 2,
                                      style: subTitleStyle.copyWith(
                                        color: Colors.black,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        top: Dimensions.h5,
                                      ),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage("${data.image}"),
                                            fit: BoxFit.fitHeight),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                )),
          ],
        ),
      ),
    );
  }
}
