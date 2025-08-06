import 'package:flutter/material.dart';
import 'package:shop/constants/colors.dart';
import 'package:shop/widgets/product_item.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

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
                        "assets/images/testa.png",
                        height: 25,
                        width: 25,
                      ),

                      Expanded(
                        child: Text(
                          textAlign: TextAlign.center,
                          "پر فروش ترین ها",
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
            padding: const EdgeInsets.symmetric(horizontal: 44),

            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                return ProductItem();
              }),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 2 / 2.7,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
