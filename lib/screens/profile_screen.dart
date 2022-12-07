import 'package:flutter/material.dart';
import 'package:shop/widgets/category_item_chip.dart';

import '../constants/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.backgroundScreenColor,
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 44, right: 44, bottom: 32, top: 20),
            child: Container(
              height: 46,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(children: [
                Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Image.asset("assets/images/icon_apple_blue.png")),
                const Expanded(
                  child: Text(
                    "حساب کاربری",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "SB",
                      color: ColorApp.blue,
                    ),
                  ),
                ),
              ]),
            ),
          ),
          const Text(
            "امید کرمی",
            style: TextStyle(fontSize: 16, fontFamily: "SB"),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 7, bottom: 30),
            child: Text(
              "09305295898",
              style:
                  TextStyle(fontSize: 10, fontFamily: "SM", color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 44),
            child: Wrap(
              textDirection: TextDirection.rtl,
              spacing: 20,
              runSpacing: 20,
              children: const [
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
          const Spacer(),
          const Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Text(
              "اپل شاپ",
              style: TextStyle(
                  fontFamily: "SM", fontSize: 10, color: ColorApp.grey),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Text(
              "V-1.0.00",
              style: TextStyle(
                  fontFamily: "SM", fontSize: 10, color: ColorApp.grey),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 32),
            child: Text(
              "Instagram.com/Mojavad-dev",
              style: TextStyle(
                  fontFamily: "SM", fontSize: 10, color: ColorApp.grey),
            ),
          ),
        ]),
      ),
    );
  }
}
