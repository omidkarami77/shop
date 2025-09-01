import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/bloc/categoryProduct/category_product_bloc.dart';
import 'package:shop/data/model/category.dart';
import 'package:shop/screens/product_list_screen.dart';
import 'package:shop/widgets/catched_image.dart';

class CategoryItemChip extends StatelessWidget {
  final CategoryModel categories;

  // ignore: prefer_const_constructors_in_immutables
  CategoryItemChip(this.categories, {super.key});

  @override
  Widget build(BuildContext context) {
    int categoryColor = int.parse("0xff${categories.color}");
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => CategoryProductBloc(),
              child: ProductListScreen(categories),
            ),
          ),
        );
      },
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                decoration: ShapeDecoration(
                  color: Color(categoryColor),
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

              SizedBox(
                width: 24,
                height: 24,
                child: Center(child: CachedImage(imageUrl: categories.icon)),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            categories.title!,
            style: TextStyle(fontFamily: "SB", fontSize: 12),
          ),
        ],
      ),
    );
  }
}
