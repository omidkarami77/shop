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
      home: Scaffold(
        backgroundColor: ColorApp.backgroundScreenColor,
        body: SafeArea(
          child: CustomScrollView(slivers: [
            SliverToBoxAdapter(
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
                        return Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: categoryHorizontalItemList(),
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
                      return Padding(
                        padding: const EdgeInsets.only(left: 20),
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
                      return Padding(
                        padding: const EdgeInsets.only(left: 20),
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
      ),
    );
  }

  Padding proforosh() {
    return Padding(
      padding: const EdgeInsets.only(left: 44, right: 44, bottom: 20),
      child: Row(children: [
        Image.asset('assets/images/icon_left_categroy.png'),
        SizedBox(
          width: 10,
        ),
        Text(
          "مشاهده همه",
          style:
              TextStyle(fontFamily: "SB", color: ColorApp.blue, fontSize: 12),
        ),
        Spacer(),
        Text(
          "پر فروش ترین ها",
          style:
              TextStyle(fontFamily: "SB", color: ColorApp.grey, fontSize: 12),
        )
      ]),
    );
  }

  Padding dastebandi() {
    return Padding(
      padding: const EdgeInsets.only(left: 44, right: 44, bottom: 20),
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
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
        SizedBox(
          width: 10,
        ),
        Text(
          "مشاهده همه",
          style:
              TextStyle(fontFamily: "SB", color: ColorApp.blue, fontSize: 12),
        ),
        Spacer(),
        Text(
          "پر بازدید ترین ها",
          style:
              TextStyle(fontFamily: "SB", color: ColorApp.grey, fontSize: 12),
        )
      ]),
    );
  }
}
