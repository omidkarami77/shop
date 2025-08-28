import 'package:dartz/dartz.dart';
import 'package:shop/data/datasource/banner_datasource.dart';

import 'package:shop/data/model/banner.dart';
import 'package:shop/dr.dart';

abstract class IBannerRepository {
  Future<Either<String, List<BannerModel>>> getBanners();
}

class BannerRepository implements IBannerRepository {
  final IBannerDatasource _datasource = locator.get();

  @override
  Future<Either<String, List<BannerModel>>> getBanners() async {
    try {
      final banners = await _datasource.getBanners();
      return right(banners);
    } catch (e) {
      return left(e.toString());
    }
  }
}
