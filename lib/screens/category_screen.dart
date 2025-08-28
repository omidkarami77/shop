import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/bloc/category/bloc/category_bloc.dart';
import 'package:shop/constants/colors.dart';
import 'package:shop/data/model/category.dart';

import 'package:shop/widgets/catched_image.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  initState() {
    BlocProvider.of<CategoryBloc>(context).add(CategoryRequestListEvent());

    super.initState();
    // You can initialize any data or state here if needed
  }

  List<CategoryModel>? categories;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      children: [
                        Image.asset(
                          "assets/images/icon_apple_blue.png",
                          height: 25,
                          width: 25,
                        ),

                        Expanded(
                          child: Text(
                            textAlign: TextAlign.center,
                            "دسته بندی",
                            style: TextStyle(
                              fontSize: 16,
                              color: ColorApplication.blueIndicator,
                              fontFamily: "SB",
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoading) {
                  return SliverToBoxAdapter(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: ColorApplication.blueIndicator,
                      ),
                    ),
                  );
                } else if (state is CategoryResponseState) {
                  if (state.response.isLeft()) {
                    return SliverToBoxAdapter(
                      child: Center(
                        child: Text(
                          state.response.fold((l) => l, (r) => "Error"),
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    );
                  } else {
                    categories = state.response.getOrElse(() => []);
                    return _ListCategory(categories);
                  }
                } else {
                  return SliverToBoxAdapter(
                    child: Center(child: Text("Unexpected State")),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ListCategory extends StatelessWidget {
  final List<CategoryModel>? categories;

  const _ListCategory(this.categories);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 44),

      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate((context, index) {
          return CachedImage(imageUrl: categories?[index].thumbnail!);
        }, childCount: categories?.length ?? 0),

        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
      ),
    );
  }
}
