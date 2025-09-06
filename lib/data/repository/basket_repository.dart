import 'package:dartz/dartz.dart';
import 'package:shop/data/datasource/basket_datasource.dart';
import 'package:shop/data/model/basket_item.dart';
import 'package:shop/dr.dart';

abstract class IBasketRepository {
  Future<Either<String, void>> addProduct(BasketItem basketItem);
}

class BasketRepository implements IBasketRepository {
  final IBasketDataSource _dataSource = locator.get();

  @override
  Future<Either<String, void>> addProduct(BasketItem basketItem) async {
    try {
      await _dataSource.addProduct(basketItem);
      // ignore: void_checks
      return right("محصول به سبد خرید اضافه شد ");
    } catch (e) {
      return left('Failed to add product to basket: $e');
    }
  }
}
