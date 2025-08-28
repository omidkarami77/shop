class Variant {
  String collectionId;
  String collectionName;
  String created;

  String id;
  String name;
  String priceChange;
  String prductId;
  String typeId;
  String updated;
  String value;

  Variant(
    this.collectionId,
    this.collectionName,
    this.created,
    this.id,
    this.name,
    this.priceChange,
    this.prductId,
    this.typeId,
    this.updated,
    this.value,
  );

  factory Variant.fromJson(Map<String, dynamic> json) {
    return Variant(
      json['collectionId'] as String,
      json['collectionName'] as String,
      json['created'] as String,
      json['id'] as String,
      json['name'] as String,
      json['price_change'].toString(),
      json['product_id'] as String,
      json['type_id'] as String,
      json['updated'] as String,
      json['value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'collectionId': collectionId,
      'collectionName': collectionName,
      'created': created,
      'id': id,
      'name': name,
      'price_change': priceChange,
      'product_id': prductId,
      'type_id': typeId,
      'updated': updated,
      'value': value,
    };
  }
}
