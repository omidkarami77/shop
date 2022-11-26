import 'package:flutter/material.dart';
import 'package:shop/widgets/product_item.dart';

import '../constants/colors.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.backgroundScreenColor,
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
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
                      child: SizedBox(
                          width: 22,
                          height: 26,
                          child: Image.asset("assets/images/por_icon.png"))),
                  const Expanded(
                    child: Text(
                      "پر فروش ترین ها",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "SB",
                        color: ColorApp.blue,
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: SizedBox(
                          width: 26,
                          height: 26,
                          child: Image.asset("assets/images/right_icon.png"))),
                ]),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 44),
            sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return ProductItem();
                }),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 2.8,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 24)),
          ),
        ],
      )),
    );
  }
}
