import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shop/constants/colors.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
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
                          "آیفون",
                          style: TextStyle(
                            fontSize: 16,
                            color: ColorApplication.blueIndicator,
                            fontFamily: "SB",
                          ),
                        ),
                      ),
                      Image.asset(
                        "assets/images/icon_back.png",
                        height: 25,
                        width: 25,
                      ),
                      SizedBox(width: 8),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 20),
            sliver: SliverToBoxAdapter(
              child: Text(
                textAlign: TextAlign.center,
                "آیفون se 2022",
                style: TextStyle(fontFamily: "SB", fontSize: 16),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 44),
            sliver: SliverToBoxAdapter(
              child: Container(
                height: 284,

                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 15,
                          right: 15,
                          top: 10,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Image.asset("assets/images/icon_star.png"),
                            SizedBox(width: 5),
                            Text(
                              "4.6",
                              style: TextStyle(fontFamily: "SM", fontSize: 12),
                            ),
                            Spacer(),
                            SizedBox(
                              height: double.infinity,
                              child: Image.asset("assets/images/iphone.png"),
                            ),
                            Spacer(),
                            Image.asset(
                              "assets/images/icon_favorite_deactive.png",
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 70,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 44),
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(left: 20),
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  width: 1,
                                  color: ColorApplication.grey,
                                ),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Image.asset(
                                    "assets/images/iphone.png",
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    textAlign: TextAlign.start,
                    "انتخاب رنگ",
                    style: TextStyle(fontFamily: "SB", fontSize: 12),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 26,
                        height: 26,
                        decoration: BoxDecoration(
                          color: ColorApplication.red,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        width: 26,
                        height: 26,
                        decoration: BoxDecoration(
                          color: ColorApplication.red,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                      ),
                      SizedBox(width: 10),

                      Container(
                        width: 26,
                        height: 26,
                        decoration: BoxDecoration(
                          color: ColorApplication.red,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 44),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    textAlign: TextAlign.start,
                    "انتخاب حافظه داخلی",
                    style: TextStyle(fontFamily: "SB", fontSize: 12),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 74,
                        height: 26,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          border: Border.all(
                            width: 0.5,
                            color: ColorApplication.grey,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "512",

                            style: TextStyle(
                              fontFamily: "SB",
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: 10),
                      Container(
                        width: 74,
                        height: 26,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          border: Border.all(
                            width: 0.5,
                            color: ColorApplication.grey,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "256 ",

                            style: TextStyle(
                              fontFamily: "SB",
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),

                      Container(
                        width: 74,
                        height: 26,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          border: Border.all(
                            width: 0.5,
                            color: ColorApplication.grey,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "128",

                            style: TextStyle(
                              fontFamily: "SB",
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 46,
              width: 340,
              margin: EdgeInsets.only(top: 20, left: 44, right: 44),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 1, color: ColorApplication.grey),
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
              child: Row(
                children: [
                  SizedBox(width: 10),
                  Image.asset(
                    width: 20,
                    height: 20,
                    "assets/images/icon_left_categroy.png",
                  ),
                  SizedBox(width: 10),
                  Text(
                    "مشاهده",
                    style: TextStyle(
                      fontFamily: "SB",
                      fontSize: 12,
                      color: ColorApplication.blueIndicator,
                    ),
                  ),

                  Spacer(),

                  Text(
                    ": مشخصات فنی ",
                    style: TextStyle(
                      fontFamily: "SM",
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 46,
              width: 340,
              margin: EdgeInsets.only(top: 20, left: 44, right: 44),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 1, color: ColorApplication.grey),
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
              child: Row(
                children: [
                  SizedBox(width: 10),
                  Image.asset(
                    width: 20,
                    height: 20,
                    "assets/images/icon_left_categroy.png",
                  ),
                  SizedBox(width: 10),
                  Text(
                    "مشاهده",
                    style: TextStyle(
                      fontFamily: "SB",
                      fontSize: 12,
                      color: ColorApplication.blueIndicator,
                    ),
                  ),

                  Spacer(),

                  Text(
                    ": توضیحات محصول ",
                    style: TextStyle(
                      fontFamily: "SM",
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 46,
              width: 340,
              margin: EdgeInsets.only(top: 20, left: 44, right: 44),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 1, color: ColorApplication.grey),
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
              child: Row(
                children: [
                  SizedBox(width: 10),
                  Image.asset(
                    width: 20,
                    height: 20,
                    "assets/images/icon_left_categroy.png",
                  ),
                  SizedBox(width: 10),
                  Text(
                    "مشاهده",
                    style: TextStyle(
                      fontFamily: "SB",
                      fontSize: 12,
                      color: ColorApplication.blueIndicator,
                    ),
                  ),

                  Spacer(),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: 26,
                        height: 26,
                        decoration: BoxDecoration(
                          color: ColorApplication.red,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                      ),
                      Positioned(
                        right: 15,
                        child: Container(
                          width: 26,
                          height: 26,
                          decoration: BoxDecoration(
                            color: ColorApplication.green,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 30,
                        child: Container(
                          width: 26,
                          height: 26,
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 45,
                        child: Container(
                          width: 26,
                          height: 26,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 60,
                        child: Container(
                          width: 26,
                          height: 26,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Center(
                            child: Text(
                              "+10",
                              style: TextStyle(
                                fontFamily: "SB",
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 10),
                  Text(
                    ": نظرات کاربران ",
                    style: TextStyle(
                      fontFamily: "SB",
                      fontSize: 10,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 32, bottom: 32),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PriceTagButton(),
                  SizedBox(width: 20),

                  AddToBasketButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AddToBasketButton extends StatelessWidget {
  const AddToBasketButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          height: 60,
          width: 140,

          decoration: BoxDecoration(
            color: ColorApplication.blueIndicator,
            borderRadius: BorderRadius.all(Radius.circular(15)),
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
        ),

        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Container(color: Colors.white.withValues(alpha: 0.2)),
              ),
              Container(
                height: 53,
                width: 160,
                alignment: Alignment.center,
                child: Text(
                  "افزودن به سبد خرید",
                  style: TextStyle(
                    fontFamily: "SB",
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PriceTagButton extends StatelessWidget {
  const PriceTagButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          height: 60,
          width: 140,

          decoration: BoxDecoration(
            color: ColorApplication.green,
            borderRadius: BorderRadius.all(Radius.circular(15)),
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
        ),

        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Container(color: Colors.white.withValues(alpha: 0.2)),
              ),
              Container(
                height: 53,
                width: 160,
                alignment: Alignment.center,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 10),
                    Text(
                      textAlign: TextAlign.center,
                      "تومان",
                      style: TextStyle(
                        fontFamily: "SB",
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 5,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "17,800,000",
                            style: TextStyle(
                              color: Colors.white,
                              decorationColor: Colors.white,
                              decoration:
                                  TextDecoration.lineThrough, // خط خورده
                              decorationThickness:
                                  2, // ضخامت خط، مقدار عددی برحسب logical pixels
                              fontFamily: "SB",

                              fontSize: 12,
                            ),
                          ),
                          Text(
                            "16,989,000",
                            style: TextStyle(
                              fontFamily: "SB",
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Spacer(),
                    Container(
                      width: 25,
                      height: 15,
                      decoration: BoxDecoration(
                        color: ColorApplication.red,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Center(
                        child: Text(
                          "5%",
                          style: TextStyle(
                            fontFamily: "SB",
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 13),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
