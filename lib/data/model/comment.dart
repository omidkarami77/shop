class CommentClass {
  String id;
  String text;
  String productId;
  String userId;

  CommentClass(this.id, this.text, this.productId, this.userId);

  factory CommentClass.fromJson(Map<String, dynamic> json) {
    return CommentClass(
      json['id'],
      json['text'],
      json['product_id'],
      json['user_id'],
    );
  }
}
