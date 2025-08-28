part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductLoadingState extends ProductState {}

final class ProductDetailResponseState extends ProductState {
  final Either<String, List<ProductImage>> getProductImage;
  final Either<String, List<ProductVariant>> productVariantTypes;

  ProductDetailResponseState(this.getProductImage, this.productVariantTypes);
}
