class VariantType {
  String collectionId;
  String collectionName;
  String created;
  String id;
  String name;
  String title;
  VariantTypeEnum type;
  String updated;

  VariantType(
    this.collectionId,
    this.collectionName,
    this.created,
    this.id,
    this.name,
    this.title,
    this.type,
    this.updated,
  );
  factory VariantType.fromJson(Map<String, dynamic> json) {
    return VariantType(
      json['collectionId'],
      json['collectionName'],
      json['created'],
      json['id'],
      json['name'],
      json['title'],
      _getTypeEnum(json['type']),
      json['updated'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['collectionId'] = collectionId;
    data['collectionName'] = collectionName;
    data['created'] = created;
    data['id'] = id;
    data['name'] = name;
    data['title'] = title;
    data['type'] = type;
    data['updated'] = updated;

    return data;
  }
}

enum VariantTypeEnum { color, storage, voltage }

VariantTypeEnum _getTypeEnum(String type) {
  switch (type) {
    case 'Color':
      return VariantTypeEnum.color;
    case 'Storage':
      return VariantTypeEnum.storage;

    case 'Voltage':
      return VariantTypeEnum.voltage;

    default:
      return VariantTypeEnum.color;
  }
}
