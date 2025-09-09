import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/bloc/basket/bloc/basket_bloc.dart';

import 'package:shop/bloc/product/product_bloc.dart';
import 'package:shop/constants/colors.dart';

import 'package:shop/data/model/product.dart';
import 'package:shop/data/model/product_image.dart';
import 'package:shop/data/model/product_property.dart';
import 'package:shop/data/model/product_variant.dart';
import 'package:shop/data/model/variant.dart';
import 'package:shop/data/model/variant_type.dart';

import 'package:shop/widgets/catched_image.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  /*  bool _isInit = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInit) {
      BlocProvider.of<ProductBloc>(
        context,
      ).add(ProductInitEvent(widget.product.id, widget.product.category));
      _isInit = true;
    }
  }
*/
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        var bloc = ProductBloc();
        bloc.add(ProductInitEvent(widget.product.id, widget.product.category));
        return bloc;
      },
      child: DetailContentWidget(widget: widget),
    );
  }
}

class DetailContentWidget extends StatelessWidget {
  const DetailContentWidget({super.key, required this.widget});

  final ProductDetailScreen widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApplication.backgroundScreenColor,
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          return SafeArea(
            child: CustomScrollView(
              slivers: [
                if (state is ProductLoadingState) ...[
                  SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator()),
                  ),
                ],

                if (state is ProductDetailResponseState) ...[
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
                            /* BoxShadow(
                          // ignore: deprecated_member_use
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 15,
                          spreadRadius: -5,
                          offset: Offset(0, 15),
                        ), */
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
                                child: state.productCategory.fold(
                                  (error) {
                                    return Text(
                                      "خطا در دریافت دسته بندی",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: ColorApplication.blueIndicator,
                                        fontFamily: "SB",
                                      ),
                                    );
                                  },
                                  (category) {
                                    return Text(
                                      textAlign: TextAlign.center,
                                      category.title ?? "بدون دسته بندی",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: ColorApplication.blueIndicator,
                                        fontFamily: "SB",
                                      ),
                                    );
                                  },
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
                ],
                SliverPadding(
                  padding: const EdgeInsets.only(bottom: 20),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      textAlign: TextAlign.center,
                      widget.product.name,
                      style: TextStyle(fontFamily: "SB", fontSize: 16),
                    ),
                  ),
                ),
                if (state is ProductDetailResponseState) ...[
                  state.getProductImage.fold(
                    (error) {
                      return SliverToBoxAdapter(child: Text(error));
                    },
                    (response) {
                      return GalleryWidget(widget.product.thumbnail, response);
                    },
                  ),
                ],
                if (state is ProductDetailResponseState) ...[
                  state.productVariantTypes.fold(
                    (error) {
                      return SliverToBoxAdapter(child: Text(error));
                    },
                    (productVariantList) {
                      return VariantContainerGenerator(productVariantList);
                    },
                  ),
                ],

                if (state is ProductDetailResponseState) ...[
                  state.productProperties.fold(
                    (error) {
                      return SliverToBoxAdapter(child: Text(error));
                    },
                    (productPropertiesList) {
                      return ProductProperties(productPropertiesList);
                    },
                  ),
                ],
                ProductDescription(widget.product.description),
                SliverToBoxAdapter(
                  child: Container(
                    height: 46,
                    width: 340,
                    margin: EdgeInsets.only(top: 20, left: 44, right: 44),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        width: 1,
                        color: ColorApplication.grey,
                      ),
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
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 15,
                              child: Container(
                                width: 26,
                                height: 26,
                                decoration: BoxDecoration(
                                  color: ColorApplication.green,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
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
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
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
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
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
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
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

                        AddToBasketButton(widget.product),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ProductProperties extends StatefulWidget {
  final List<Property> productProperties;
  const ProductProperties(this.productProperties, {super.key});

  @override
  State<ProductProperties> createState() => _ProductPropertiesState();
}

class _ProductPropertiesState extends State<ProductProperties> {
  bool invisible = false;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          GestureDetector(
            onTap: () => setState(() {
              invisible = !invisible;
            }),
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
          Visibility(
            visible: invisible,
            child: Container(
              height: 200,
              margin: EdgeInsets.only(top: 20, left: 44, right: 44),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 1, color: ColorApplication.grey),
              ),
              child: ListView.builder(
                itemCount: widget.productProperties.length,
                itemBuilder: (context, index) {
                  var property = widget.productProperties[index];
                  return Row(
                    children: [Text('${property.title} : ${property.value}')],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductDescription extends StatefulWidget {
  final String productDescription;
  const ProductDescription(this.productDescription, {super.key});

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  bool invisible = false;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          GestureDetector(
            onTap: () => setState(() {
              invisible = !invisible;
            }),
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
          Visibility(
            visible: invisible,
            child: Container(
              width: 340,
              margin: EdgeInsets.only(top: 20, left: 44, right: 44),
              padding: EdgeInsets.all(12),
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
              child: Text(
                textAlign: TextAlign.right,
                style: TextStyle(fontFamily: "SM", fontSize: 15, height: 2),
                widget.productDescription,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class VariantContainerGenerator extends StatefulWidget {
  final List<ProductVariant> productVariantList;
  const VariantContainerGenerator(this.productVariantList, {super.key});

  @override
  State<VariantContainerGenerator> createState() =>
      _VariantContainerGeneratorState();
}

class _VariantContainerGeneratorState extends State<VariantContainerGenerator> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          for (var productVariant in widget.productVariantList) ...[
            if (productVariant.variantList.isNotEmpty) ...[
              VariantGeneratorChild(productVariant),
            ],
          ],
        ],
      ),
    );
  }
}

class VariantGeneratorChild extends StatelessWidget {
  final ProductVariant productVariant;
  const VariantGeneratorChild(this.productVariant, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            productVariant.variantType.title,
            textAlign: TextAlign.start,

            style: TextStyle(fontFamily: "SB", fontSize: 12),
          ),
          SizedBox(height: 10),

          if (productVariant.variantType.type == VariantTypeEnum.color) ...[
            ColorVariantList(productVariant.variantList),
          ],
          if (productVariant.variantType.type == VariantTypeEnum.storage) ...[
            StorageVariantList(productVariant.variantList),
          ],
        ],
      ),
    );
  }
}

class StorageVariantList extends StatefulWidget {
  final List<Variant> storageVariants;
  const StorageVariantList(this.storageVariants, {super.key});

  @override
  State<StorageVariantList> createState() => _StorageVariantListState();
}

class _StorageVariantListState extends State<StorageVariantList> {
  List<Widget> storageWidgetList = [];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        height: 26,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.storageVariants.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                margin: EdgeInsets.only(left: 10),
                height: 26,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  border: (selectedIndex == index)
                      ? Border.all(
                          width: 2,
                          color: ColorApplication.blueIndicator,
                        )
                      : Border.all(width: 1, color: ColorApplication.grey),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Center(
                    child: Text(
                      widget.storageVariants[index].value,
                      style: TextStyle(
                        fontFamily: "SB",
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ColorVariantList extends StatefulWidget {
  final List<Variant> variantList;
  const ColorVariantList(this.variantList, {super.key});

  @override
  State<ColorVariantList> createState() => _ColorVariantListState();
}

class _ColorVariantListState extends State<ColorVariantList> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        height: 30,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.variantList.length,
          itemBuilder: (context, index) {
            String categoryColor = 'ff${widget.variantList[index].value}';
            int hexColor = int.parse(categoryColor, radix: 16);
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                margin: EdgeInsets.only(left: 10),
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  border: selectedIndex == index
                      ? Border.all(
                          width: 2,
                          color: ColorApplication.blueIndicator,
                          strokeAlign: BorderSide.strokeAlignOutside,
                        )
                      : Border.all(width: 2, color: Colors.white),
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Container(
                  height: 28,
                  width: 28,
                  decoration: BoxDecoration(
                    color: Color(hexColor),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class GalleryWidget extends StatefulWidget {
  final List<ProductImage> productImage;
  final String? defaultProductThumbnail;
  const GalleryWidget(
    this.defaultProductThumbnail,
    this.productImage, {
    super.key,
  });

  @override
  State<GalleryWidget> createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
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
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset("assets/images/icon_star.png"),
                          SizedBox(width: 5),
                          Text(
                            "4.6",
                            style: TextStyle(fontFamily: "SM", fontSize: 12),
                          ),
                        ],
                      ),
                      Spacer(),
                      SizedBox(
                        height: 200,
                        width: 200,
                        child: CachedImage(
                          imageUrl: (widget.productImage.isEmpty
                              ? widget.defaultProductThumbnail
                              : widget.productImage[selectedItem].imageUrl),
                        ),
                      ),
                      Spacer(),
                      Image.asset("assets/images/icon_favorite_deactive.png"),
                    ],
                  ),
                ),
              ),
              if (widget.productImage.isNotEmpty) ...[
                SizedBox(
                  height: 70,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 44),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedItem = index;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 20),
                            width: 70,
                            height: 70,
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                width: 1,
                                color: ColorApplication.grey,
                              ),
                            ),
                            child: Center(
                              child: CachedImage(
                                radius: 10,
                                imageUrl: widget.productImage[index].imageUrl,
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: widget.productImage.length,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class AddToBasketButton extends StatefulWidget {
  final Product product;
  const AddToBasketButton(this.product, {super.key});

  @override
  State<AddToBasketButton> createState() => _AddToBasketButtonState();
}

class _AddToBasketButtonState extends State<AddToBasketButton> {
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
              GestureDetector(
                onTap: () {
                  // Add to basket action

                  context.read<ProductBloc>().add(
                    ProductAddedToBasket(widget.product),
                  );
                  context.read<BasketBloc>().add(BasketFetchFromHiveEvent());
                },
                child: Container(
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
