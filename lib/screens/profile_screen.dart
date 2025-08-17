import 'package:flutter/material.dart';
import 'package:shop/constants/colors.dart';

import 'package:shop/widgets/category_icon_item_chip.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsetsGeometry.only(left: 44, right: 44, bottom: 32),
            child: Container(
              height: 46,
              width: 340,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 15,
                    spreadRadius: -5,
                    offset: Offset(0, 15),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/icon_apple_blue.png",
                      height: 25,
                      width: 25,
                    ),

                    Expanded(
                      child: Text(
                        textAlign: TextAlign.center,
                        "حساب کاربری",
                        style: TextStyle(
                          fontSize: 16,
                          color: ColorApplication.blueIndicator,
                          fontFamily: "SB",
                        ),
                      ),
                    ),

                    SizedBox(width: 8),
                  ],
                ),
              ),
            ),
          ),
          Text(
            "امید کرمی",
            style: TextStyle(
              fontFamily: "SB",
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "09123393795",
            style: TextStyle(
              fontFamily: "SM",
              fontSize: 12,
              color: ColorApplication.grey,
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 44, right: 44, top: 20),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Wrap(
                spacing: 30,
                runSpacing: 20,
                children: [
                  CategoryItemChip(),

                  CategoryItemChip(),

                  CategoryItemChip(),
                  CategoryItemChip(),

                  CategoryItemChip(),

                  CategoryItemChip(),

                  CategoryItemChip(),

                  CategoryItemChip(),

                  CategoryItemChip(),

                  CategoryItemChip(),
                ],
              ),
            ),
          ),
          Spacer(),
          Text(
            "مرکز خرید",
            style: TextStyle(
              fontFamily: "SM",
              fontSize: 10,
              color: ColorApplication.grey,
            ),
          ),
          Text(
            "V-1.0.0",
            style: TextStyle(
              fontFamily: "SM",
              fontSize: 10,
              color: ColorApplication.grey,
            ),
          ),
          Text(
            "www.shop.com",
            style: TextStyle(
              fontFamily: "SM",
              fontSize: 10,
              color: ColorApplication.grey,
            ),
          ),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}
