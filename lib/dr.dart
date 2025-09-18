import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/bloc/basket/bloc/basket_bloc.dart';
import 'package:shop/data/datasource/authentication_datasource.dart';
import 'package:shop/data/datasource/banner_datasource.dart';
import 'package:shop/data/datasource/basket_datasource.dart';
import 'package:shop/data/datasource/category_datasource.dart';
import 'package:shop/data/datasource/category_product_datasource.dart';
import 'package:shop/data/datasource/comment_datasource.dart';
import 'package:shop/data/datasource/product_datasource.dart';
import 'package:shop/data/datasource/product_detail_datasource.dart';
import 'package:shop/data/repository/banner_repository.dart';
import 'package:shop/data/repository/authentication_repository.dart';
import 'package:shop/data/repository/basket_repository.dart';
import 'package:shop/data/repository/category_product_repository.dart';
import 'package:shop/data/repository/category_repository.dart';
import 'package:shop/data/repository/comment_repository.dart';
import 'package:shop/data/repository/product_detail_repository.dart';
import 'package:shop/data/repository/product_repository.dart';
import 'package:shop/util/dio_provider.dart';
import 'package:shop/util/payment_handler.dart';

var locator = GetIt.instance;

Future<void> getItInit() async {
  locator.registerSingleton<PaymentHandler>(ZarinPalPayment());

  locator.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );
  locator.registerSingleton<Dio>(DioProvider.createDio());

  locator.registerFactory<IAuthenticationRemote>(() => AuthenticationRemote());
  locator.registerFactory<IAuthenticationRepository>(
    () => AuthenticationRepository(),
  );

  locator.registerFactory<ICategoryDataSource>(() => CategoryDataSource());

  locator.registerFactory<ICategoryRepository>(() => CategoryRepository());

  locator.registerFactory<IBannerDatasource>(() => BannerDatasource());

  locator.registerFactory<IBannerRepository>(() => BannerRepository());

  locator.registerFactory<IProductDataSource>(() => ProductDataSource());

  locator.registerFactory<IProductRepository>(() => ProductRepository());

  locator.registerFactory<IProductDetailDataSource>(
    () => ProductDetailDatasource(),
  );

  locator.registerFactory<IProductDetailRepository>(
    () => ProductDetailRepository(),
  );

  locator.registerFactory<ICategoryProductDataSource>(
    () => CategoryProductDatasource(),
  );

  locator.registerFactory<ICategoryProductRepository>(
    () => CategoryProductRepository(),
  );

  locator.registerFactory<IBasketDataSource>(() => BasketLocalDataSource());

  locator.registerFactory<IBasketRepository>(() => BasketRepository());
  locator.registerFactory<BasketBloc>(
    () => BasketBloc(locator.get(), locator.get()),
  );

  locator.registerFactory<ICommentDataSource>(() => CommentDatasource());
  locator.registerFactory<ICommentRepository>(() => CommentRepository());
}
