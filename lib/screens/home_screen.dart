import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/bloc/home/home_bloc.dart';
import 'package:shop/constants/colors.dart';
import 'package:shop/data/model/banner.dart';
import 'package:shop/data/model/category.dart';
import 'package:shop/data/model/product.dart';
import 'package:shop/widgets/banner_slider.dart';
import 'package:shop/widgets/category_icon_item_chip.dart';
import 'package:shop/widgets/product_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(HomeGetInitializeData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApplication.backgroundScreenColor,

      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                if (state is HomeLoadingState) ...[
                  SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator()),
                  ),
                ],

                _GetSearchBox(),

                if (state is HomeRequestSuccessState) ...[
                  state.response.fold(
                    (error) => SliverToBoxAdapter(
                      child: Center(
                        child: Text(
                          'Error: $error',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                    (banners) {
                      return _GetBanners(banners);
                    },
                  ),
                ],

                _GetCategoryListTitle(),

                if (state is HomeRequestSuccessState) ...[
                  state.category.fold(
                    (error) => SliverToBoxAdapter(
                      child: Center(
                        child: Text(
                          'Error: $error',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                    (categories) {
                      return _GetCategoryList(categories);
                    },
                  ),
                ],

                _GetBestSellerTitle(),

                if (state is HomeRequestSuccessState) ...[
                  state.bestSellerProductList.fold(
                    (error) => SliverToBoxAdapter(
                      child: Center(
                        child: Text(
                          'Error: $error',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                    (bestProduct) {
                      return _GetBestSellerProduct(bestProduct);
                    },
                  ),
                ],

                _GetMostViewedTitle(),

                if (state is HomeRequestSuccessState) ...[
                  state.hottestProductList.fold(
                    (error) => SliverToBoxAdapter(
                      child: Center(
                        child: Text(
                          'Error: $error',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                    (bestProduct) {
                      return _GetMostViewedProduct(bestProduct);
                    },
                  ),
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}

class _GetMostViewedProduct extends StatelessWidget {
  final List<Product> mostViewedProduct;
  const _GetMostViewedProduct(this.mostViewedProduct);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
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
                  child: ProductItem(mostViewedProduct[index]),
                ),
              );
            },
            itemCount: mostViewedProduct.length,
            shrinkWrap: true,

            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }
}

class _GetMostViewedTitle extends StatelessWidget {
  const _GetMostViewedTitle();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 44, right: 44, top: 32),
        child: Row(
          children: [
            Text(
              "پر بازدید ترین ها",
              style: TextStyle(
                fontFamily: "SB",
                fontSize: 12,
                color: ColorApplication.grey,
              ),
            ),
            Spacer(),

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
          ],
        ),
      ),
    );
  }
}

class _GetBestSellerProduct extends StatelessWidget {
  final List<Product> bestProduct;
  const _GetBestSellerProduct(this.bestProduct);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
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
                  child: ProductItem(bestProduct[index]),
                ),
              );
            },
            itemCount: bestProduct.length,
            shrinkWrap: true,

            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }
}

class _GetBestSellerTitle extends StatelessWidget {
  const _GetBestSellerTitle();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 44),
        child: Row(
          children: [
            Text(
              "پر فروش ترین ها",
              style: TextStyle(
                fontFamily: "SB",
                fontSize: 12,
                color: ColorApplication.grey,
              ),
            ),

            Spacer(),

            Text(
              "مشاهده همه",
              style: TextStyle(
                fontFamily: "SB",
                fontSize: 12,
                color: ColorApplication.blueIndicator,
              ),
            ),
            SizedBox(width: 10),
            Image.asset(
              "assets/images/icon_left_categroy.png",
              height: 20,
              width: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class _GetCategoryList extends StatelessWidget {
  final List<CategoryModel> categories;
  const _GetCategoryList(this.categories);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(right: 44, bottom: 32),
        child: SizedBox(
          height: 85,
          child: ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 20),
                child: CategoryItemChip(categories[index]),
              );
            },
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }
}

class _GetCategoryListTitle extends StatelessWidget {
  const _GetCategoryListTitle();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(right: 44, bottom: 20, top: 32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
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
    );
  }
}

class _GetBanners extends StatelessWidget {
  final List<BannerModel> banners;

  const _GetBanners(this.banners);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child: BannerSlider(banners));
  }
}

class _GetSearchBox extends StatelessWidget {
  const _GetSearchBox();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/icon_search.png",
                  height: 25,
                  width: 25,
                ),

                Expanded(
                  child: TextField(
                    maxLength: 25,

                    textDirection: TextDirection.rtl, // یا ltr یا autoسیب
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
                  "assets/images/icon_apple_blue.png",
                  height: 25,
                  width: 25,
                ),

                SizedBox(width: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
