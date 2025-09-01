import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:shop/data/datasource/product_detail_datasource.dart';
import 'package:shop/data/model/category.dart';
import 'package:shop/data/model/product_image.dart';
import 'package:shop/data/model/product_property.dart';
import 'package:shop/data/model/product_variant.dart';
import 'package:shop/data/model/variant.dart';
import 'package:shop/data/model/variant_type.dart';
import 'package:shop/dr.dart';
import 'package:shop/util/api_exception.dart';

abstract class IProductDetailRepository {
  Future<Either<String, List<ProductImage>>> getProductImage(String productId);
  Future<Either<String, List<VariantType>>> getVariantTypes();
  Future<Either<String, List<Variant>>> getVariants(String productId);
  Future<Either<String, List<ProductVariant>>> getProductVariants(
    String productId,
  );
  Future<Either<String, CategoryModel>> getProductCategory(String categoryId);
  Future<Either<String, List<Property>>> getProductProperties(String productId);
}

class ProductDetailRepository implements IProductDetailRepository {
  IProductDetailDataSource productDataSource = locator.get();
  @override
  Future<Either<String, List<ProductImage>>> getProductImage(
    String productId,
  ) async {
    try {
      final categories = await productDataSource.getGallery(productId);
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

  @override
  Future<Either<String, List<VariantType>>> getVariantTypes() async {
    try {
      final variantType = await productDataSource.getVariantTypes();
      return right(variantType);
    } on DioException catch (e) {
      throw ApiException(
        code: e.response?.statusCode,
        message: e.response?.data['message'] ?? 'An error occurred',
      );
    } catch (e) {
      throw ApiException(code: 0, message: 'An unexpected error occurred');
    }
  }

  @override
  Future<Either<String, List<Variant>>> getVariants(String productId) async {
    try {
      final variants = await productDataSource.getVariant(productId);
      return right(variants);
    } on DioException catch (e) {
      throw ApiException(
        code: e.response?.statusCode,
        message: e.response?.data['message'] ?? 'An error occurred',
      );
    } catch (e) {
      throw ApiException(code: 0, message: 'An unexpected error occurred');
    }
  }

  @override
  Future<Either<String, List<ProductVariant>>> getProductVariants(
    String productId,
  ) async {
    try {
      final variants = await productDataSource.getProductVariants(productId);
      return right(variants);
    } on DioException catch (e) {
      return left(e.response?.data['message'] ?? 'An error occurred');
    } catch (e) {
      return left('An unexpected error occurred');
    }
  }

  @override
  Future<Either<String, CategoryModel>> getProductCategory(
    String categoryId,
  ) async {
    try {
      final category = await productDataSource.getProductCategory(categoryId);

      return right(category);
    } on DioException catch (e) {
      return left(e.response?.data['message'] ?? 'An error occurred');
    } catch (e) {
      return left('An unexpected error occurred');
    }
  }

  @override
  Future<Either<String, List<Property>>> getProductProperties(
    String productId,
  ) async {
    try {
      final properties = await productDataSource.getProductProperties(
        productId,
      );
      return right(properties);
    } on DioException catch (e) {
      return left(e.response?.data['message'] ?? 'An error occurred');
    } catch (e) {
      return left('An unexpected error occurred');
    }
  }
}
