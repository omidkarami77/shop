import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shop/data/model/category.dart';
import 'package:shop/dr.dart';

abstract class ICategoryDataSource {
  Future<List<CategoryModel>> getCategories();
}

class CategoryDataSource implements ICategoryDataSource {
  final Dio _dio = locator.get();
  @override
  Future<List<CategoryModel>> getCategories() async {
    // Simulating network delay

    // Sample data

    try {
      final response = await _dio.get('api/collections/category/records');
      if (response.statusCode == 200) {
        List<CategoryModel> categories = (response.data['items'] as List)
            .map((item) => CategoryModel.fromJson(item))
            .toList();
        return categories;
      } else {
        throw Exception('Failed to load categories');
      }
    } on DioException catch (e) {
      debugPrint('DioException: ${e.message}');
      throw Exception('Failed to load categories: ${e.message}');
    } catch (e) {
      debugPrint('Exception: $e');
      throw Exception('Failed to load categories: $e');
    }
  }
}
