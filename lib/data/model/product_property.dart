class Property {
  String collectionId;
  String collectionName;
  String created;
  String id;
  String productId;
  String title;
  String updated;
  String value;

  Property({
    required this.collectionId,
    required this.collectionName,
    required this.created,
    required this.id,
    required this.productId,
    required this.title,
    required this.updated,
    required this.value,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      collectionId: json['collectionId'],
      collectionName: json['collectionName'],
      created: json['created'],
      id: json['id'],
      productId: json['product_id'],
      title: json['title'],
      updated: json['updated'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'collectionId': collectionId,
      'collectionName': collectionName,
      'created': created,
      'id': id,
      'product_id': productId,
      'title': title,
      'updated': updated,
      'value': value,
    };
  }
}
