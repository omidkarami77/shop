part of 'basket_bloc.dart';

@immutable
sealed class BasketEvent {}

class BasketFetchFromHiveEvent extends BasketEvent {}

class BasketPaymentInitEvent extends BasketEvent {}

class BasketPaymentRequestEvent extends BasketEvent {}
