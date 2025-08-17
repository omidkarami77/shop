import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/data/datasource/authentication_datasource.dart';
import 'package:shop/data/repository/authentication_repository.dart';

var locator = GetIt.instance;

Future<void> getItInit() async {
  locator.registerSingleton<Dio>(
    Dio(BaseOptions(baseUrl: 'https://startflutter.ir/')),
  );

  locator.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );
  locator.registerFactory<IAuthenticationRemote>(() => AuthenticationRemote());
  locator.registerFactory<IAuthenticationRepository>(
    () => AuthenticationRepository(),
  );
}
