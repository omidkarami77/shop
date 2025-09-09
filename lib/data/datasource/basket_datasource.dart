import 'package:hive/hive.dart';
import 'package:shop/data/model/basket_item.dart';

abstract class IBasketDataSource {
  Future<void> addProduct(BasketItem basketItem);
  Future<List<BasketItem>> getAllBasketItems();
  Future<int> getBasketFinalPrice();
}

class BasketLocalDataSource implements IBasketDataSource {
  var box = Hive.box<BasketItem>('basket_items');

  @override
  Future<void> addProduct(BasketItem basketItem) async {
    await box.add(basketItem);
  }

  @override
  Future<List<BasketItem>> getAllBasketItems() async {
    return box.values.toList();
  }

  @override
  Future<int> getBasketFinalPrice() async {
    var productlist = box.values.toList();
    final price = productlist.fold(
      0,
      (accumulator, product) => accumulator + product.realPrice,
    );

    return price;
  }
}
