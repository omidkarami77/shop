import 'package:dio/dio.dart';
import 'package:shop/data/model/product_image.dart';
import 'package:shop/data/model/product_variant.dart';
import 'package:shop/data/model/variant.dart';
import 'package:shop/data/model/variant_type.dart';
import 'package:shop/dr.dart';

abstract class IProductDetailDataSource {
  Future<List<ProductImage>> getGallery(String productId);
  Future<List<VariantType>> getVariantTypes();
  Future<List<Variant>> getVariant();
  Future<List<ProductVariant>> getProductVariants();
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
  Future<List<Variant>> getVariant() async {
    try {
      Map<String, String> qParams = {'filter': 'product_id="5vvww65pv6nviw6"'};
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
  Future<List<ProductVariant>> getProductVariants() async {
    var variantTypeList = await getVariantTypes();
    var variantList = await getVariant();

    List<ProductVariant> productVariantList = [];

    for (var variantType in variantTypeList) {
      var variantLists = variantList
          .where((element) => element.typeId == variantType.id)
          .toList();

      productVariantList.add(ProductVariant(variantType, variantLists));
    }
    return productVariantList;
  }
}
