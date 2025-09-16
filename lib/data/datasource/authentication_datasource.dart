import 'package:dio/dio.dart';
import 'package:shop/util/auth_manager.dart';

import 'package:shop/util/dio_provider.dart';
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
  final Dio _loginDio = DioProvider.createLoginDioWithoutHeader();
  @override
  Future<void> register(
    String username,
    String password,
    String passwordConfirm,
  ) async {
    try {
      await _loginDio.post(
        'api/collections/users/records',
        data: {
          'username': username,
          'password': password,
          'passwordConfirm': passwordConfirm,
        },
      );
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
      final response = await _loginDio.post(
        'api/collections/users/auth-with-password',
        data: {'identity': username, 'password': password},
      );

      if (response.statusCode == 200) {
        AuthManager.saveId(response.data['record']['id']);
        var token = response.data['token'];
        return token;
      }
    } on DioException catch (e) {
      throw ApiException(
        code: e.response?.statusCode,
        message: e.response?.data['message'] ?? 'An error occurred',
      );
    } catch (e) {
      throw ApiException(message: 'An unexpected error occurred');
    }
    return '';
  }
}
