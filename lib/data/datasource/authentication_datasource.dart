import 'package:dio/dio.dart';
import 'package:shop/dr.dart';
import 'package:shop/util/api_exception.dart';

abstract class IAuthenticationRemote {
  Future<void> register(
    String username,
    String password,
    String passwordConfirm,
  );

  Future<String> login(String username, String password);
}

class AuthenticationRemote implements IAuthenticationRemote {
  final Dio _dio = locator.get();

  Future<void> register(
    String username,
    String password,
    String passwordConfirm,
  ) async {
    try {
      final response = await _dio.post(
        'api/collections/users/records',
        data: {
          'username': username,
          'password': password,
          'passwordConfirm': passwordConfirm,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Registration successful: ${response.data}');
      } else {
        print('Registration failed with status: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw ApiException(
        code: e.response?.statusCode,
        message: e.response?.data['message'] ?? 'An error occurred',
      );
    } catch (e) {
      throw ApiException(message: 'An unexpected error occurred');
    }
  }

  @override
  Future<String> login(String username, String password) async {
    try {
      final response = await _dio.post(
        'api/collections/users/auth-with-password',
        data: {'identity': username, 'password': password},
      );
      if (response.statusCode == 200) {
        return response.data['token'];
      } else {
        throw ApiException(
          code: response.statusCode,
          message: 'Login failed with status: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      throw ApiException(
        code: e.response?.statusCode,
        message: e.response?.data['message'] ?? 'An error occurred',
      );
    } catch (e) {
      throw ApiException(message: 'An unexpected error occurred');
    }
  }
}
