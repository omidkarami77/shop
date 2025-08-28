import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:shop/data/model/banner.dart';
import 'package:shop/data/model/category.dart';
import 'package:shop/data/model/product.dart';
import 'package:shop/data/repository/banner_repository.dart';
import 'package:shop/data/repository/category_repository.dart';
import 'package:shop/data/repository/product_repository.dart';
import 'package:shop/dr.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  IBannerRepository bannerRepository = locator.get();
  ICategoryRepository categoryRepository = locator.get();
  IProductRepository productRepository = locator.get();

  HomeBloc() : super(HomeInitial()) {
    on<HomeGetInitializeData>((event, emit) async {
      emit(HomeLoadingState());
      var response = await bannerRepository.getBanners();
      var category = await categoryRepository.getCategories();
      var products = await productRepository.getProducts();
      var bestSellerProductList = await productRepository
          .getBestSellerProduct();
      var hottestProductList = await productRepository.getHottestProduct();

      emit(
        HomeRequestSuccessState(
          response,
          category,
          products,
          hottestProductList,
          bestSellerProductList,
        ),
      );
    });
  }
}
