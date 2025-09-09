part of 'basket_bloc.dart';

@immutable
sealed class BasketState {}

final class BasketInitial extends BasketState {}

class BasketDataFetchedState extends BasketState {
  final Either<String, List<BasketItem>> items;
  final int basketFinalPrice;
  BasketDataFetchedState(this.items, this.basketFinalPrice);
}
