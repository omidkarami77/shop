import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/bloc/basket/bloc/basket_bloc.dart';

import 'package:shop/constants/colors.dart';
import 'package:shop/data/model/product.dart';
import 'package:shop/dr.dart';
import 'package:shop/screens/product_detail_screen.dart';
import 'package:shop/widgets/catched_image.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BlocProvider<BasketBloc>.value(
              value: locator.get<BasketBloc>(),
              child: ProductDetailScreen(product: product),
            ),
          ),
        );
      },
      child: Container(
        height: 216,
        width: 160,
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
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 10),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(width: double.infinity),
                SizedBox(
                  height: 90,
                  width: 90,

                  child: CachedImage(imageUrl: product.thumbnail),
                ),
                Positioned(
                  top: 0,
                  right: 10,
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: Image.asset("assets/images/active_fav_product.png"),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      child: Text(
                        '%${product.persent!.round().toString()}',
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

            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10, bottom: 10),
                  child: Text(
                    maxLines: 1,
                    product.name,
                    style: TextStyle(fontFamily: "SM", fontSize: 14),
                  ),
                ),

                Container(
                  height: 53,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    color: ColorApplication.blueIndicator,
                    boxShadow: [
                      BoxShadow(
                        color: ColorApplication.blueIndicator,
                        blurRadius: 15,
                        spreadRadius: -12,
                        offset: Offset(0, 15),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          "assets/images/icon_right_arrow_cricle.png",
                          height: 20,
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              product.realPrice.toString(),
                              style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                decorationColor: Colors.white,
                                decorationThickness: 2,
                                fontFamily: "SM",
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              product.price.toString(),
                              style: TextStyle(
                                fontFamily: "SM",
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),

                        Text(
                          "تومان",
                          style: TextStyle(
                            fontFamily: "SM",
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
