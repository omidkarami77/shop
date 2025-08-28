import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shop/data/model/banner.dart';
import 'package:shop/dr.dart';

abstract class IBannerDatasource {
  Future<List<BannerModel>> getBanners();
}

class BannerDatasource implements IBannerDatasource {
  final Dio _dio = locator.get();

  @override
  Future<List<BannerModel>> getBanners() async {
    try {
      final response = await _dio.get('api/collections/banner/records');
      if (response.statusCode == 200) {
        List<BannerModel> banners = (response.data['items'] as List)
            .map((item) => BannerModel.fromJson(item))
            .toList();
        return banners;
      } else {
        throw Exception('Failed to load banners');
      }
    } on DioException catch (e) {
      debugPrint('DioException: ${e.message}');
      throw Exception('Failed to load banners: ${e.message}');
    } catch (e) {
      debugPrint('Exception: $e');
      throw Exception('Failed to load banners: $e');
    }
  }

  // Here you can implement methods to fetch banner data from an API or database
}
