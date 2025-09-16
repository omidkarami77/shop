import 'package:dartz/dartz.dart';
import 'package:shop/data/datasource/comment_datasource.dart';
import 'package:shop/data/model/comment.dart';
import 'package:shop/dr.dart';

abstract class ICommentRepository {
  Future<Either<String, List<CommentClass>>> getComments(String productId);
  Future<Either<String, void>> postComment(String productId, String comment);
}

class CommentRepository implements ICommentRepository {
  ICommentDataSource commentDataSource = locator.get();
  @override
  Future<Either<String, List<CommentClass>>> getComments(
    String productId,
  ) async {
    try {
      final comments = await commentDataSource.getComments(productId);
      return right(comments);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> postComment(
    String productId,
    String comment,
  ) async {
    try {
      final result = await commentDataSource.postComment(productId, comment);
      return right(result);
    } catch (e) {
      return left(e.toString());
    }
  }
}
