import 'package:app_links/app_links.dart';
import 'package:flutter/widgets.dart';
import 'package:shop/util/url_handler.dart';

import 'package:zarinpal/src/call_backs.dart';
import 'package:zarinpal/zarinpal.dart';

abstract class PaymentHandler {
  Future<void> initPaymentRequest();
  Future<void> sendPaymentRequest();
  Future<void> verifyPaymentRequest();
}

class ZarinPalPayment implements PaymentHandler {
  void onVerify(
    bool isPaymentSuccess,
    String? refId,
    PaymentRequest paymentRequest,
  ) {
    if (isPaymentSuccess) {
      debugPrint('پرداخت با موفقیت انجام شد');
      debugPrint('refId: $refId');
    } else {
      debugPrint('پرداخت با شکست مواجه شد');
    }
  }

  PaymentRequest paymentRequest = PaymentRequest();
  String? authority;
  String? status;

  @override
  Future<void> initPaymentRequest() async {
    paymentRequest.setIsSandBox(true);
    paymentRequest.setAmount(111000);
    paymentRequest.setDescription("test payment");
    paymentRequest.setCallbackURL('https://sandbox.zarinpal.com/pg/StartPay/');
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
        verifyPaymentRequest();
      }
    });
  }

  @override
  Future<void> sendPaymentRequest() async {
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
        UrlLauncher().openUrl(paymentGateWayUri);
      }
    });
  }

  @override
  Future<void> verifyPaymentRequest() async {
    if (status != null && authority != null) {
      ZarinPal().verificationPayment(
        status!,
        authority!,
        paymentRequest,
        onVerify as OnCallbackVerificationPaymentListener,
      );
    } else {
      debugPrint('خطا: status یا authority مقدار ندارد');
    }
  }
}

/*



*/
