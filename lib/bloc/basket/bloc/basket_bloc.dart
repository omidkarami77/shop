import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';

import 'package:shop/data/model/basket_item.dart';
import 'package:shop/data/repository/basket_repository.dart';

import 'package:shop/util/payment_handler.dart';

part 'basket_event.dart';
part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  final IBasketRepository repository;
  final PaymentHandler paymentHandler;
  BasketBloc(this.paymentHandler, this.repository) : super(BasketInitial()) {
    on<BasketFetchFromHiveEvent>((event, emit) async {
      var response = await repository.getAllBasketItems();
      var basketFinalPrice = await repository.getBasketFinalPrice();
      emit(BasketDataFetchedState(response, basketFinalPrice));
    });

    on<BasketPaymentInitEvent>((event, emit) async {
      paymentHandler.initPaymentRequest();
    });

    // فقط یک handler برای BasketPaymentRequestEvent تعریف شود
    on<BasketPaymentRequestEvent>((event, emit) async {
      paymentHandler.sendPaymentRequest();
    });
  }
}
