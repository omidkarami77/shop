part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoadingState extends HomeState {}

// ignore: must_be_immutable
final class HomeRequestSuccessState extends HomeState {
  Either<String, List<BannerModel>> response;
  Either<String, List<CategoryModel>> category;
  Either<String, List<Product>> products;
  Either<String, List<Product>> hottestProductList;
  Either<String, List<Product>> bestSellerProductList;

  HomeRequestSuccessState(
    this.response,
    this.category,
    this.products,
    this.hottestProductList,
    this.bestSellerProductList,
  );
}
