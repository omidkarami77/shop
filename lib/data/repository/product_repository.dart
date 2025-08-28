import 'package:dartz/dartz.dart';
import 'package:shop/data/datasource/product_datasource.dart';
import 'package:shop/data/model/product.dart';
import 'package:shop/dr.dart';

abstract class IProductRepository {
  Future<Either<String, List<Product>>> getProducts();
  Future<Either<String, List<Product>>> getHottestProduct();
  Future<Either<String, List<Product>>> getBestSellerProduct();
}

class ProductRepository implements IProductRepository {
  final IProductDataSource _datasource = locator.get();

  @override
  Future<Either<String, List<Product>>> getProducts() async {
    try {
      final products = await _datasource.getProducts();
      return right(products);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<Product>>> getBestSellerProduct() async {
    try {
      final products = await _datasource.getBestSellerProduct();
      return right(products);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<Product>>> getHottestProduct() async {
    try {
      final products = await _datasource.getHottestProduct();
      return right(products);
    } catch (e) {
      return left(e.toString());
    }
  }
}
