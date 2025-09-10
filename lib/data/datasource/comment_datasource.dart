import 'package:dio/dio.dart';
import 'package:shop/data/model/comment.dart';
import 'package:shop/dr.dart';
import 'package:shop/util/api_exception.dart';

abstract class ICommentDataSource {
  Future<List<CommentClass>> getComments(String productId);
}

class CommentDatasource implements ICommentDataSource {
  @override
  Future<List<CommentClass>> getComments(String productId) async {
    final Dio _dio = locator.get();
    try {
      var response = await _dio.get(
        'api/collections/comment/records',
        queryParameters: {'filter': 'product_id="$productId"'},
      );
      return (response.data['items'] as List)
          .map((item) => CommentClass.fromJson(item))
          .toList();
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
