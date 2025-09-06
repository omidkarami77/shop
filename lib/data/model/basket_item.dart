import 'package:hive/hive.dart';

part 'basket_item.g.dart';

@HiveType(typeId: 0)
class BasketItem {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String description;
  @HiveField(3)
  int price;
  @HiveField(4)
  String category;
  @HiveField(5)
  String collectionId;
  @HiveField(6)
  String collectionName;
  @HiveField(7)
  int discountPrice;
  @HiveField(8)
  String popularity;
  @HiveField(9)
  int quantity;
  @HiveField(10)
  String thumbnail;
  @HiveField(11)
  int realPrice;
  @HiveField(12)
  double persent;

  BasketItem(
    this.id,
    this.name,
    this.description,
    this.price,
    this.category,
    this.collectionId,
    this.collectionName,
    this.discountPrice,
    this.popularity,
    this.quantity,
    this.thumbnail,
    int? realPrice,
    double? persent,
  ) : realPrice = realPrice ?? price + discountPrice,
      persent =
          persent ??
          ((price - (realPrice ?? price + discountPrice)) / price) * 100;
}
