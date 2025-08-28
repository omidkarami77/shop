import 'package:dio/dio.dart';
import 'package:shop/data/model/product.dart';
import 'package:shop/dr.dart';

abstract class IProductDataSource {
  Future<List<Product>> getProducts();
  Future<List<Product>> getHottestProduct();
  Future<List<Product>> getBestSellerProduct();
}

class ProductDataSource implements IProductDataSource {
  @override
  Future<List<Product>> getProducts() async {
    final Dio dio = locator.get();

    try {
      final response = await dio.get('api/collections/products/records');
      if (response.statusCode == 200) {
        List<Product> products = (response.data['items'] as List)
            .map((item) => Product.fromJson(item))
            .toList();

        return products;
      } else {
        throw Exception('Failed to load products');
      }
    } on DioException catch (e) {
      throw Exception('Failed to load products: ${e.message}');
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }

  @override
  Future<List<Product>> getHottestProduct() async {
    final Dio dio = locator.get();

    try {
      final response = await dio.get(
        'api/collections/products/records',
        queryParameters: {'filter': 'popularity = "Hotest"'},
      );

      if (response.statusCode == 200) {
        List<Product> products = (response.data['items'] as List)
            .map((item) => Product.fromJson(item))
            .toList();

        return products;
      } else {
        throw Exception('Failed to load hottest products');
      }
    } on DioException catch (e) {
      throw Exception('Failed to load hottest products: ${e.message}');
    } catch (e) {
      throw Exception('Failed to load hottest products: $e');
    }
  }

  @override
  Future<List<Product>> getBestSellerProduct() async {
    final Dio dio = locator.get();

    try {
      final response = await dio.get(
        'api/collections/products/records',
        queryParameters: {'filter': 'popularity="Best Seller"'},
      );

      if (response.statusCode == 200) {
        List<Product> products = (response.data['items'] as List)
            .map((item) => Product.fromJson(item))
            .toList();

        return products;
      } else {
        throw Exception('Failed to load hottest products');
      }
    } on DioException catch (e) {
      throw Exception('Failed to load hottest products: ${e.message}');
    } catch (e) {
      throw Exception('Failed to load hottest products: $e');
    }
  }
}
