import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:shop/data/model/basket_item.dart';
import 'package:shop/data/model/category.dart';
import 'package:shop/data/model/product.dart';

import 'package:shop/data/model/product_image.dart';
import 'package:shop/data/model/product_property.dart';
import 'package:shop/data/model/product_variant.dart';
import 'package:shop/data/repository/basket_repository.dart';

import 'package:shop/data/repository/product_detail_repository.dart';
import 'package:shop/dr.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  IProductDetailRepository productDetailRepository = locator.get();
  final IBasketRepository basketRepository = locator.get();
  ProductBloc() : super(ProductInitial()) {
    on<ProductInitEvent>((event, emit) async {
      emit(ProductLoadingState());
      var response = await productDetailRepository.getProductImage(
        event.productId,
      );
      var productVariant = await productDetailRepository.getProductVariants(
        event.productId,
      );
      var productCategory = await productDetailRepository.getProductCategory(
        event.categoryId,
      );
      var productProperties = await productDetailRepository
          .getProductProperties(event.productId);
      emit(
        ProductDetailResponseState(
          response,
          productVariant,
          productCategory,
          productProperties,
        ),
      );
    });

    on<ProductAddedToBasket>((event, emit) async {
      var basketItem = BasketItem(
        event.product.id,
        event.product.name,
        event.product.description,
        event.product.price,
        event.product.category,
        event.product.collectionId,
        event.product.collectionName,
        event.product.discountPrice,
        event.product.popularity,
        1,
        event.product.thumbnail,
        event.product.realPrice,
        event.product.persent as double?,
      );
      basketRepository.addProduct(basketItem);
    });
  }
}
