class Product {
  String id;
  String name;
  String description;
  int price;
  String category;
  String collectionId;
  String collectionName;
  int discountPrice;
  String popularity;
  int quantity;
  String thumbnail;
  int? realPrice;
  num? persent;

  Product(
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
  ) {
    realPrice = price + discountPrice;
    persent = ((price - realPrice!) / price) * 100;
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      json['id'] as String,
      json['name'] as String,
      json['description'] as String,
      json['price'] as int,
      json['category'] as String,
      json['collectionId'] as String,
      json['collectionName'] as String,
      json['discount_price'] as int,
      json['popularity'] as String,
      json['quantity'] as int,
      'http://startflutter.ir/api/files/${json['collectionId']}/${json['id']}/${json['thumbnail']}',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['category'] = category;
    data['collectionId'] = collectionId;
    data['collectionName'] = collectionName;
    data['discountPrice'] = discountPrice;
    data['popularity'] = popularity;
    data['quantity'] = quantity;
    data['thumbnail'] = thumbnail;
    return data;
  }
}
