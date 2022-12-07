import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../constants/colors.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 44, right: 44, bottom: 32, top: 20),
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
                      "دسته بندی",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "SB",
                        color: ColorApp.blue,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Image.asset("assets/images/right_icon.png")
                ]),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                "آیفون 14",
                style: TextStyle(
                    fontFamily: "SB", fontSize: 16, color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 44),
              child: Container(
                height: 284,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 15, right: 15, top: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset("assets/images/icon_star.png"),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "4.6",
                              style: TextStyle(fontFamily: "SM", fontSize: 12),
                            ),
                            Spacer(),
                            SizedBox(
                                height: double.infinity,
                                child: Image.asset("assets/images/iphone.png")),
                            Spacer(),
                            Image.asset(
                                "assets/images/icon_favorite_deactive.png"),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                      child: Padding(
                        padding: EdgeInsets.only(left: 44, right: 44),
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(left: 20),
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    border: Border.all(
                                        width: 1, color: ColorApp.grey)),
                                child: Padding(
                                  padding: EdgeInsets.all(6),
                                  child:
                                      Image.asset("assets/images/iphone.png"),
                                ),
                              );
                            }),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, right: 44, left: 44),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "انتخاب رنگ",
                    style: TextStyle(fontFamily: "SM", fontSize: 12),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        height: 26,
                        width: 26,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        height: 26,
                        width: 26,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        height: 26,
                        width: 26,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
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
            child: Padding(
              padding: const EdgeInsets.only(top: 20, right: 44, left: 44),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "انتخاب حافظه داخلی",
                    style: TextStyle(fontFamily: "SM", fontSize: 12),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        height: 25,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            border: Border.all(width: 1, color: ColorApp.grey)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Center(
                              child: Text(
                            "128",
                            style: TextStyle(fontFamily: "SM", fontSize: 12),
                          )),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        height: 25,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            border: Border.all(width: 1, color: ColorApp.grey)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Center(
                              child: Text(
                            "128",
                            style: TextStyle(fontFamily: "SM", fontSize: 12),
                          )),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        height: 25,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            border: Border.all(width: 1, color: ColorApp.grey)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Center(
                              child: Text(
                            "128",
                            style: TextStyle(fontFamily: "SM", fontSize: 12),
                          )),
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
              padding: const EdgeInsets.only(left: 44, right: 44, top: 20),
              child: Container(
                height: 46,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 1, color: ColorApp.grey),
                ),
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Image.asset("assets/images/icon_blue_left.png"),
                  ),
                  Text(
                    "مشاهده",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: "SB",
                      color: ColorApp.blue,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      "مشخصات فنی",
                      style: TextStyle(fontFamily: "SM", fontSize: 12),
                    ),
                  )
                ]),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 44, right: 44, top: 20),
              child: Container(
                height: 46,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 1, color: ColorApp.grey),
                ),
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Image.asset("assets/images/icon_blue_left.png"),
                  ),
                  Text(
                    "مشاهده",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: "SB",
                      color: ColorApp.blue,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      "توضیحات محصول",
                      style: TextStyle(fontFamily: "SM", fontSize: 12),
                    ),
                  )
                ]),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 44, right: 44, top: 20),
              child: Container(
                height: 46,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 1, color: ColorApp.grey),
                ),
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Image.asset("assets/images/icon_blue_left.png"),
                  ),
                  Text(
                    "مشاهده",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: "SB",
                      color: ColorApp.blue,
                    ),
                  ),
                  Spacer(),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        height: 26,
                        width: 26,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 15,
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          height: 26,
                          width: 26,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 30,
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          height: 26,
                          width: 26,
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 45,
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          height: 26,
                          width: 26,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 60,
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          height: 26,
                          width: 26,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          child: Center(
                              child: Text(
                            "+10",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "SB",
                                color: Colors.white),
                          )),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      "نظرات کاربران",
                      style: TextStyle(fontFamily: "SM", fontSize: 12),
                    ),
                  )
                ]),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PriceTagButton(),
                  SizedBox(
                    width: 20,
                  ),
                  AddToBasketButton(),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 30,
            ),
          )
        ]),
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
          width: 140,
          height: 60,
          decoration: BoxDecoration(
            color: ColorApp.blue,
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              width: 160,
              height: 53,
              child: Center(
                  child: Text(
                "افزودن سبد خرید",
                style: TextStyle(
                    fontFamily: "SB", fontSize: 15, color: Colors.white),
              )),
            ),
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
          width: 140,
          height: 60,
          decoration: BoxDecoration(
            color: ColorApp.green,
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              width: 160,
              height: 53,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(mainAxisSize: MainAxisSize.max, children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 2),
                    child: Text(
                      "تومان",
                      style: TextStyle(
                          fontFamily: "SM", fontSize: 12, color: Colors.white),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "49.800.000",
                        style: TextStyle(
                            fontFamily: "SM",
                            decoration: TextDecoration.lineThrough,
                            fontSize: 12,
                            color: Colors.white),
                      ),
                      Text(
                        "48.800.000",
                        style: TextStyle(
                            fontFamily: "SM",
                            fontSize: 12,
                            color: Colors.white),
                      )
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                        child: Text(
                          "%3",
                          style: TextStyle(
                              fontFamily: "SB",
                              fontSize: 12,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
