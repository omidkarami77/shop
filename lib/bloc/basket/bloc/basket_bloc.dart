import 'package:app_links/app_links.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';

import 'package:shop/data/model/basket_item.dart';
import 'package:shop/data/repository/basket_repository.dart';
import 'package:shop/dr.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zarinpal/zarinpal.dart';

part 'basket_event.dart';
part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  BasketBloc() : super(BasketInitial()) {
    final IBasketRepository repository = locator.get();
    PaymentRequest paymentRequest = PaymentRequest();

    on<BasketFetchFromHiveEvent>((event, emit) async {
      var response = await repository.getAllBasketItems();
      var basketFinalPrice = await repository.getBasketFinalPrice();
      emit(BasketDataFetchedState(response, basketFinalPrice));
    });

    on<BasketPaymentInitEvent>((event, emit) async {
      paymentRequest.setIsSandBox(true);
      paymentRequest.setAmount(111000);
      paymentRequest.setDescription("test payment");
      paymentRequest.setCallbackURL(
        'https://sandbox.zarinpal.com/pg/StartPay/',
      );
      paymentRequest.setMerchantID('6fb03226-dc60-449c-936f-1657272a9c14');

      final appLinks = AppLinks();
      appLinks.stringLinkStream.listen((String? link) {
        debugPrint('--- appLinks callback ---');
        debugPrint('link: $link');
        if (link != null) {
          Uri uri = Uri.parse(link);
          String? status = uri.queryParameters['status'];
          String? authority = uri.queryParameters['authority'];
          debugPrint('status: $status');
          debugPrint('authority: $authority');
        }
      });
    });

    // فقط یک handler برای BasketPaymentRequestEvent تعریف شود
    on<BasketPaymentRequestEvent>((event, emit) async {
      ZarinPal().startPayment(paymentRequest, (
        int? status,
        String? paymentGateWayUri,
        Map<String, dynamic>? data,
      ) {
        debugPrint('status: $status');
        debugPrint('paymentGateWayUri: $paymentGateWayUri');
        debugPrint('data: $data');
        if (status == 100 &&
            paymentGateWayUri != null &&
            paymentGateWayUri.isNotEmpty) {
          launchUrl(
            Uri.parse(paymentGateWayUri),
            mode: LaunchMode.externalApplication,
          );
        }
      });
    });
  }
}
