class CommentClass {
  String id;
  String text;
  String productId;
  String userId;
  String uerThumbnail;
  String username;
  String avatar;

  CommentClass(
    this.id,
    this.text,
    this.productId,
    this.userId,
    this.uerThumbnail,
    this.username,
    this.avatar,
  );

  factory CommentClass.fromJson(Map<String, dynamic> json) {
    return CommentClass(
      json['id'],
      json['text'],
      json['product_id'],
      json['user_id'],
      'http://startflutter.ir/api/files/${json['expand']['user_id']['collectionName']}/${json['expand']['user_id']['id']}/${json['expand']['user_id']['avatar']}',

      json['expand']['user_id']['name'],
      json['expand']['user_id']['avatar'],
    );
  }
}
