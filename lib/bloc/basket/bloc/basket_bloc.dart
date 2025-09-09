import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:shop/data/model/basket_item.dart';
import 'package:shop/data/repository/basket_repository.dart';
import 'package:shop/dr.dart';

part 'basket_event.dart';
part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  BasketBloc() : super(BasketInitial()) {
    final IBasketRepository repository = locator.get();

    on<BasketFetchFromHiveEvent>((event, emit) async {
      var response = await repository.getAllBasketItems();
      var basketFinalPrice = await repository.getBasketFinalPrice();
      emit(BasketDataFetchedState(response, basketFinalPrice));
    });
  }
}
