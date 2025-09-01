part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductLoadingState extends ProductState {}

final class ProductDetailResponseState extends ProductState {
  final Either<String, List<ProductImage>> getProductImage;
  final Either<String, List<ProductVariant>> productVariantTypes;
  final Either<String, CategoryModel> productCategory;
  final Either<String, List<Property>> productProperties;

  ProductDetailResponseState(
    this.getProductImage,
    this.productVariantTypes,
    this.productCategory,
    this.productProperties,
  );
}
