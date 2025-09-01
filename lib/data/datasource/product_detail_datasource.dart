import 'package:dio/dio.dart';

import 'package:shop/data/model/category.dart';
import 'package:shop/data/model/product_image.dart';
import 'package:shop/data/model/product_property.dart';
import 'package:shop/data/model/product_variant.dart';
import 'package:shop/data/model/variant.dart';
import 'package:shop/data/model/variant_type.dart';
import 'package:shop/dr.dart';

abstract class IProductDetailDataSource {
  Future<List<ProductImage>> getGallery(String productId);
  Future<List<VariantType>> getVariantTypes();
  Future<List<Variant>> getVariant(String productId);
  Future<List<ProductVariant>> getProductVariants(String productId);
  Future<CategoryModel> getProductCategory(String categoryId);
  Future<List<Property>> getProductProperties(String productId);
}

class ProductDetailDatasource implements IProductDetailDataSource {
  final Dio dio = locator.get();
  @override
  Future<List<ProductImage>> getGallery(String productId) async {
    try {
      Map<String, String> qParam = {'filter': 'product_id="$productId"'};
      final response = await dio.get(
        'api/collections/gallery/records',
        queryParameters: qParam,
      );
      if (response.statusCode == 200) {
        List<ProductImage> products = (response.data['items'] as List)
            .map((item) => ProductImage.fromJson(item))
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
  Future<List<VariantType>> getVariantTypes() async {
    try {
      final response = await dio.get('api/collections/variants_type/records');
      if (response.statusCode == 200) {
        List<VariantType> variantType = (response.data['items'] as List)
            .map((item) => VariantType.fromJson(item))
            .toList();

        return variantType;
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
  Future<List<Variant>> getVariant(String productId) async {
    try {
      Map<String, String> qParams = {'filter': 'product_id="$productId"'};
      final response = await dio.get(
        'api/collections/variants/records',
        queryParameters: qParams,
      );
      if (response.statusCode == 200) {
        List<Variant> variants = (response.data['items'] as List)
            .map((item) => Variant.fromJson(item))
            .toList();

        return variants;
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
  Future<List<ProductVariant>> getProductVariants(String productId) async {
    var variantTypeList = await getVariantTypes();
    var variantList = await getVariant(productId);

    List<ProductVariant> productVariantList = [];

    for (var variantType in variantTypeList) {
      var variantLists = variantList
          .where((element) => element.typeId == variantType.id)
          .toList();

      productVariantList.add(ProductVariant(variantType, variantLists));
    }
    return productVariantList;
  }

  @override
  Future<CategoryModel> getProductCategory(String categoryId) async {
    Map<String, String> qParams = {'filter': 'id="$categoryId"'};
    try {
      final response = await dio.get(
        "api/collections/category/records",
        queryParameters: qParams,
      );
      if (response.statusCode == 200) {
        final items = response.data['items'] as List;
        if (items.isNotEmpty) {
          return CategoryModel.fromJson(items.first);
        } else {
          throw Exception('Category not found');
        }
      } else {
        throw Exception('Failed to load product category');
      }
    } on DioException catch (e) {
      throw Exception('Failed to load product category: ${e.message}');
    } catch (e) {
      throw Exception('Failed to load product category: $e');
    }
  }

  @override
  Future<List<Property>> getProductProperties(String productId) async {
    try {
      Map<String, String> qParams = {'filter': 'product_id="$productId"'};
      final response = await dio.get(
        'api/collections/properties/records',
        queryParameters: qParams,
      );
      if (response.statusCode == 200) {
        List<Property> properties = (response.data['items'] as List)
            .map((item) => Property.fromJson(item))
            .toList();

        return properties;
      } else {
        throw Exception('Failed to load product properties');
      }
    } on DioException catch (e) {
      throw Exception('Failed to load product properties: ${e.message}');
    } catch (e) {
      throw Exception('Failed to load product properties: $e');
    }
  }
}
