import 'package:flutter/material.dart';
import 'package:shop/constants/colors.dart';
import 'package:shop/widgets/banner_slider.dart';
import 'package:shop/widgets/product_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: ColorApplication.backgroundScreenColor,

        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsetsGeometry.only(
                    left: 44,
                    right: 44,
                    bottom: 32,
                  ),
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/icon_apple_blue.png",
                            height: 25,
                            width: 25,
                          ),

                          Expanded(
                            child: TextField(
                              maxLength: 25,

                              textDirection:
                                  TextDirection.rtl, // یا ltr یا autoسیب
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                counterText: '', // حذف شمارنده

                                hintText: 'جست‌وجوی محصولات',
                                border: InputBorder.none,
                                isCollapsed: true,

                                hintStyle: TextStyle(
                                  fontFamily: "SM",
                                  fontSize: 16,
                                  color: ColorApplication.grey,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Image.asset(
                            "assets/images/icon_search.png",
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
              SliverToBoxAdapter(child: BannerSlider()),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 44,
                    bottom: 20,
                    top: 32,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "دسته بندی",
                        style: TextStyle(
                          fontFamily: "SB",
                          fontSize: 12,
                          color: ColorApplication.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(right: 44, bottom: 32),
                  child: SizedBox(
                    height: 85,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: CategoryHorizontalItemList(),
                        );
                      },
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 44),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/icon_left_categroy.png",
                        height: 20,
                        width: 20,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "مشاهده همه",
                        style: TextStyle(
                          fontFamily: "SB",
                          fontSize: 12,
                          color: ColorApplication.blueIndicator,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "پر فروش ترین ها",
                        style: TextStyle(
                          fontFamily: "SB",
                          fontSize: 12,
                          color: ColorApplication.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(right: 44),
                  child: SizedBox(
                    height: 220,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: ProductItem(),
                          ),
                        );
                      },
                      itemCount: 10,
                      shrinkWrap: true,

                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 44, right: 44, top: 32),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/icon_left_categroy.png",
                        height: 20,
                        width: 20,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "مشاهده همه",
                        style: TextStyle(
                          fontFamily: "SB",
                          fontSize: 12,
                          color: ColorApplication.blueIndicator,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "پر بازدید ترین ها",
                        style: TextStyle(
                          fontFamily: "SB",
                          fontSize: 12,
                          color: ColorApplication.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(right: 44),
                  child: SizedBox(
                    height: 220,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: ProductItem(),
                          ),
                        );
                      },
                      itemCount: 10,
                      shrinkWrap: true,

                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryHorizontalItemList extends StatelessWidget {
  const CategoryHorizontalItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              decoration: ShapeDecoration(
                color: Colors.red,
                shadows: [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 20,
                    spreadRadius: -5,
                    offset: Offset(0, 15),
                  ),
                ],
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              height: 56,
              width: 56,
            ),

            Icon(Icons.shopping_cart, size: 30, color: Colors.white),
          ],
        ),
        SizedBox(height: 10),
        Text("همه", style: TextStyle(fontFamily: "SB", fontSize: 12)),
      ],
    );
  }
}
