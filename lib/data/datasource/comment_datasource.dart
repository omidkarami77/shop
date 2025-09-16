import 'package:dio/dio.dart';
import 'package:shop/data/model/comment.dart';
import 'package:shop/dr.dart';
import 'package:shop/util/api_exception.dart';
import 'package:shop/util/auth_manager.dart';

abstract class ICommentDataSource {
  Future<List<CommentClass>> getComments(String productId);
  Future<void> postComment(String productId, String comment);
}

class CommentDatasource implements ICommentDataSource {
  final Dio _dio = locator.get();
  var userId = AuthManager.getId();
  @override
  Future<List<CommentClass>> getComments(String productId) async {
    try {
      Map<String, dynamic> qParams = {
        'filter': 'product_id="$productId"',
        'expand': 'user_id',
        'perPage': 200,
      };

      var response = await _dio.get(
        'api/collections/comment/records',
        queryParameters: qParams,
      );
      var comments = (response.data['items'] as List)
          .map((item) => CommentClass.fromJson(item))
          .toList();
      return comments;
    } on DioException catch (ex) {
      throw ApiException(
        code: ex.response?.statusCode,
        message: ex.response?.data['message'],
      );
    } catch (ex) {
      throw ApiException(code: 0, message: 'An unexpected error occurred');
    }
  }

  @override
  Future<void> postComment(String productId, String comment) async {
    try {
      await _dio.post(
        'api/collections/comment/records',
        data: {'text': comment, 'user_id': userId, 'product_id': productId},
      );
    } on DioException catch (ex) {
      throw ApiException(
        code: ex.response?.statusCode,
        message: ex.response?.data['message'],
      );
    } catch (ex) {
      throw ApiException(code: 0, message: 'An unexpected error occurred');
    }
  }
}
