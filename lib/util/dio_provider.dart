import 'package:dio/dio.dart';
import 'package:shop/util/auth_manager.dart';

class DioProvider {
  static Dio createDio() {
    final token = AuthManager.readAuth();

    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://startflutter.ir/',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
    );
    return dio;
  }

  // For login requests (no Authorization header)
  static Dio createLoginDioWithoutHeader() {
    final dio = Dio(BaseOptions(baseUrl: 'https://startflutter.ir/'));
    return dio;
  }
}
