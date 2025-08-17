import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/data/datasource/authentication_datasource.dart';
import 'package:shop/dr.dart';
import 'package:shop/util/api_exception.dart';
import 'package:shop/util/auth_manager.dart';

abstract class IAuthenticationRepository {
  Future<Either<String, String>> register(
    String username,
    String password,
    String passwordConfirm,
  );

  Future<Either<String, String>> login(String username, String password);
}

class AuthenticationRepository implements IAuthenticationRepository {
  final IAuthenticationRemote _datasource = locator.get();
  final SharedPreferences _sharedPreferences = locator.get();

  Future<Either<String, String>> register(
    String username,
    String password,
    String passwordConfirm,
  ) async {
    try {
      await _datasource.register(username, password, passwordConfirm);
      return right("okeeeeeeeeeeeeee");
    } on ApiException catch (e) {
      return left(e.message!);
    }
  }

  @override
  Future<Either<String, String>> login(String username, String password) async {
    try {
      final token = await _datasource.login(username, password);
      if (token.isNotEmpty) {
        AuthManager.saveToken(token);
        return right("شما وارد شدید ");
      } else {
        return left("خطایی رخ داده است");
      }
    } on ApiException catch (e) {
      return left(e.message!);
    }
  }
}
