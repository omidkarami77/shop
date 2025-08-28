part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}

class ProductInitEvent extends ProductEvent {
  final String productId;
  ProductInitEvent(this.productId);
}
