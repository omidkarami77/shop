import 'package:dio/dio.dart';

import 'package:shop/data/model/product.dart';
import 'package:shop/dr.dart';

abstract class ICategoryProductDataSource {
  Future<List<Product>> getProductsByCategory(String categoryId);
}

class CategoryProductDatasource implements ICategoryProductDataSource {
  final Dio _dio = locator.get();
  @override
  Future<List<Product>> getProductsByCategory(String categoryId) async {
    try {
      Map<String, String> qParam = {'filter': 'category="$categoryId"'};
      Response<dynamic> response;

      if (categoryId == 'qnbj8d6b9lzzpn8') {
        response = await _dio.get('api/collections/products/records');
      } else {
        response = await _dio.get(
          'api/collections/products/records',
          queryParameters: qParam,
        );
      }

      return (response.data['items']
          .map<Product>((item) => Product.fromJson(item))
          .toList());
    } on DioException catch (e) {
      throw Exception('Failed to load products: ${e.message}');
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }
}
