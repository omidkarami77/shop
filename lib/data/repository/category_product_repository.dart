import 'package:dartz/dartz.dart';

import 'package:shop/data/datasource/category_product_datasource.dart';
import 'package:shop/data/model/product.dart';
import 'package:shop/dr.dart';

abstract class ICategoryProductRepository {
  Future<Either<String, List<Product>>> getProductsByCategory(
    String categoryId,
  );
}

class CategoryProductRepository implements ICategoryProductRepository {
  ICategoryProductDataSource dataSource = locator.get();
  @override
  Future<Either<String, List<Product>>> getProductsByCategory(
    String categoryId,
  ) async {
    try {
      final products = await dataSource.getProductsByCategory(categoryId);
      return Right(products);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
