import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:trajan_market/app/services/dimensions.dart';

class BuildLoadingAllProducts extends StatelessWidget {
  final int? itemCount;

  const BuildLoadingAllProducts({required this.itemCount, Key? key})
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
