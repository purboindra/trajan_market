import 'package:flutter/material.dart';

import 'package:trajan_market/app/services/dimensions.dart';
import 'package:trajan_market/app/services/theme.dart';

class ProfileIconWidget extends StatelessWidget {
  final String name;
  final IconData icon;

  ProfileIconWidget({required this.name, required this.icon, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: Dimensions.h20,
              ),
              SizedBox(
                width: Dimensions.w20,
              ),
              Text(
                name,
                style: titleStyle.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
