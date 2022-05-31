import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trajan_market/app/model/all_products_model.dart';
import 'package:trajan_market/app/services/dimensions.dart';

class BuildLoadingAllProducts extends StatelessWidget {
  int? itemCount;

  BuildLoadingAllProducts({required this.itemCount, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.w10,
        vertical: Dimensions.h10,
      ),
      child: GridView.builder(
          itemCount: itemCount,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 250,
          ),
          itemBuilder: (context, index) {
            return Shimmer.fromColors(
              child: Card(
                child: Container(
                  width: double.infinity,
                  height: 100,
                ),
              ),
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
            );
          }),
    );
  }
}
