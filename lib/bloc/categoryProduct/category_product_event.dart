part of 'category_product_bloc.dart';

@immutable
sealed class CategoryProductEvent {}

class CategoryProductGetInitializeData extends CategoryProductEvent {
  final String categoryId;

  CategoryProductGetInitializeData(this.categoryId);
}
