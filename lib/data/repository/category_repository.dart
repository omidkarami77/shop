import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shop/data/datasource/category_datasource.dart';
import 'package:shop/data/model/category.dart';

import 'package:shop/dr.dart';
import 'package:shop/util/api_exception.dart';

abstract class ICategoryRepository {
  Future<Either<String, List<CategoryModel>>> getCategories();
}

class CategoryRepository implements ICategoryRepository {
  final ICategoryDataSource _datasource = locator.get();

  @override
  Future<Either<String, List<CategoryModel>>> getCategories() async {
    try {
      final categories = await _datasource.getProductByCategory();
      return right(categories);
    } on DioException catch (e) {
      throw ApiException(
        code: e.response?.statusCode,
        message: e.response?.data['message'] ?? 'An error occurred',
      );
    } catch (e) {
      throw ApiException(code: 0, message: 'An unexpected error occurred');
    }
  }
}
