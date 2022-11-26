import 'package:flutter/material.dart';
import 'package:shop/widgets/category_item_chip.dart';

import '../constants/colors.dart';
import '../widgets/banner_slider.dart';
import '../widgets/product_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.backgroundScreenColor,
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
                      "جست و جوی محصولات",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "SB",
                        color: ColorApp.grey,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15, left: 10),
                    child: Image.asset("assets/images/icon_search.png"),
                  ),
                ]),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: BannerSlider(),
          ),
          SliverToBoxAdapter(
            child: dastebandi(),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(right: 44),
              child: SizedBox(
                height: 100,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: CategoryItemChip(),
                      );
                    }),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: proforosh(),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(right: 44),
              child: SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: ProductItem(),
                    );
                  },
                  itemCount: 10,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: probazdid(),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(right: 44),
              child: SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: ProductItem(),
                    );
                  },
                  itemCount: 10,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }

  Padding proforosh() {
    return Padding(
      padding: const EdgeInsets.only(left: 44, right: 44, bottom: 20),
      child: Row(children: [
        Image.asset('assets/images/icon_left_categroy.png'),
        const SizedBox(
          width: 10,
        ),
        const Text(
          "مشاهده همه",
          style:
              TextStyle(fontFamily: "SB", color: ColorApp.blue, fontSize: 12),
        ),
        const Spacer(),
        const Text(
          "پر فروش ترین ها",
          style:
              TextStyle(fontFamily: "SB", color: ColorApp.grey, fontSize: 12),
        )
      ]),
    );
  }

  Padding dastebandi() {
    return Padding(
      padding: const EdgeInsets.only(left: 44, right: 44, bottom: 20, top: 32),
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: const [
        Text(
          "دسته بندی",
          style:
              TextStyle(fontFamily: "SB", color: ColorApp.grey, fontSize: 12),
        ),
      ]),
    );
  }

  Padding probazdid() {
    return Padding(
      padding: const EdgeInsets.only(left: 44, right: 44, bottom: 20, top: 32),
      child: Row(children: [
        Image.asset('assets/images/icon_left_categroy.png'),
        const SizedBox(
          width: 10,
        ),
        const Text(
          "مشاهده همه",
          style:
              TextStyle(fontFamily: "SB", color: ColorApp.blue, fontSize: 12),
        ),
        const Spacer(),
        const Text(
          "پر بازدید ترین ها",
          style:
              TextStyle(fontFamily: "SB", color: ColorApp.grey, fontSize: 12),
        )
      ]),
    );
  }
}
