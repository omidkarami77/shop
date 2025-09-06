import 'package:hive/hive.dart';
import 'package:shop/data/model/basket_item.dart';

abstract class IBasketDataSource {
  Future<void> addProduct(BasketItem basketItem);
}

class BasketLocalDataSource implements IBasketDataSource {
  var box = Hive.box<BasketItem>('basket_items');

  @override
  Future<void> addProduct(BasketItem basketItem) async {
    await box.add(basketItem);
  }
}
