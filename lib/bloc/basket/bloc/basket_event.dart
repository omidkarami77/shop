part of 'basket_bloc.dart';

@immutable
sealed class BasketEvent {}

class BasketFetchFromHiveEvent extends BasketEvent {}
