import 'package:dartz/dartz.dart';
import 'package:shop/data/datasource/basket_datasource.dart';
import 'package:shop/data/model/basket_item.dart';
import 'package:shop/dr.dart';

abstract class IBasketRepository {
  Future<Either<String, void>> addProduct(BasketItem basketItem);
  Future<Either<String, List<BasketItem>>> getAllBasketItems();
  Future<int> getBasketFinalPrice();
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

  @override
  Future<Either<String, List<BasketItem>>> getAllBasketItems() async {
    final IBasketDataSource dataSource = locator.get();

    try {
      final items = await dataSource.getAllBasketItems();
      return right(items);
    } catch (e) {
      return left('Failed to retrieve basket items: $e');
    }
  }

  @override
  Future<int> getBasketFinalPrice() async {
    try {
      final price = await _dataSource.getBasketFinalPrice();
      return price;
    } catch (e) {
      return 0;
    }
  }
}
