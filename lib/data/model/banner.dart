class BannerModel {
  String categoryId;
  String collectionId;
  String collectionName;
  String created;
  String id;
  String thumbnail;
  String updated;

  BannerModel({
    required this.categoryId,
    required this.collectionId,
    required this.collectionName,
    required this.created,
    required this.id,
    required this.thumbnail,
    required this.updated,
  });
  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      categoryId: json['categoryId'],
      collectionId: json['collectionId'],
      collectionName: json['collectionName'],
      created: json['created'],
      id: json['id'],
      thumbnail:
          'http://startflutter.ir/api/files/${json['collectionId']}/${json['id']}/${json['thumbnail']}',
      updated: json['updated'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categoryId': categoryId,
      'collectionId': collectionId,
      'collectionName': collectionName,
      'created': created,
      'id': id,
      'thumbnail': thumbnail,
      'updated': updated,
    };
  }
}
