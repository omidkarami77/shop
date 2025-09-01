import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:shop/data/model/category.dart';

import 'package:shop/data/model/product_image.dart';
import 'package:shop/data/model/product_property.dart';
import 'package:shop/data/model/product_variant.dart';

import 'package:shop/data/repository/product_detail_repository.dart';
import 'package:shop/dr.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  IProductDetailRepository productDetailRepository = locator.get();

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
  }
}
