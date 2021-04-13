import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:levelup/DataModel/Stripe_model.dart';
import 'package:stripe_payment/stripe_payment.dart';

class StripeService {
  static String apiBase = 'https://api.stripe.com/v1';
  static String paymentApiUrl = '${StripeService.apiBase}/payment_intents';
  static String secret = 'sk_test_51IbWTVAAzXPUiIsQzNiZdL9HVdxN6eFajU9CRomuSVukYRFr9P2S5jkfZjeY6UD8bjg9Qydmd5zw9fXobHqSsDHG00hBq2k6w0';
  static Map<String, String> headers = {
    'Authorization': 'Bearer ${StripeService.secret}',
    'Content-Type': 'application/x-www-form-urlencoded'
  };

  /// this function used to attach app to stripe system
  static init() {
    StripePayment.setOptions(
        StripeOptions(
            publishableKey: "pk_test_51IbWTVAAzXPUiIsQeEkg6Wg7eEw0VINsWzz9fLnjINL4PwHyRjzlO8WyM4GvJpseuoLzwzvpt44udqgK2AyydwJc00bAwnQiki",
            merchantId: "Test",
            androidPayMode: 'test'
        )
    );
  }


  static Future<StripeTransactionResponse> payViaExistingCard({String amount, String currency, CreditCard card}) async{
    try {
      var paymentMethod = await StripePayment.createPaymentMethod(
          PaymentMethodRequest(card: card)
      );
      var paymentIntent = await StripeService.createPaymentIntent(
          amount,
          currency
      );
      var response = await StripePayment.confirmPaymentIntent(
          PaymentIntent(
              clientSecret: paymentIntent['client_secret'],
              paymentMethodId: paymentMethod.id
          )
      );
      if (response.status == 'succeeded') {
        return new StripeTransactionResponse(
            message: 'Transaction successful',
            success: true
        );
      } else {
        return new StripeTransactionResponse(
            message: 'Transaction failed',
            success: false
        );
      }
    } on PlatformException catch(err) {
      return StripeService.getPlatformExceptionErrorResult(err);
    } catch (err) {
      return new StripeTransactionResponse(
          message: 'Transaction failed: ${err.toString()}',
          success: false
      );
    }
  }


  static Future<StripeTransactionResponse> payWithNewCard({String amount, String currency}) async {
    try {

      /// this function will launch the stripe payment screen in which user will
      /// add card details
      var paymentMethod = await StripePayment.paymentRequestWithCardForm(
          CardFormPaymentRequest()
      );
      /// basically payment intent used to inform the stripe how much amount you need to
      /// take from a customer account and in which currency
      var paymentIntent = await StripeService.createPaymentIntent(
          amount,
          currency
      );

      var response = await StripePayment.confirmPaymentIntent(
          PaymentIntent(
              clientSecret: paymentIntent['client_secret'],
              paymentMethodId: paymentMethod.id
          )
      );
      if (response.status == 'succeeded') {
        return new StripeTransactionResponse(
            message: 'Transaction successful',
            success: true
        );
      } else {
        return new StripeTransactionResponse(
            message: 'Transaction failed',
            success: false
        );
      }
    } on PlatformException catch(err) {
      return StripeService.getPlatformExceptionErrorResult(err);
    } catch (err) {
      return new StripeTransactionResponse(
          message: 'Transaction failed: ${err.toString()}',
          success: false
      );
    }
  }

  static getPlatformExceptionErrorResult(err) {
    String message = 'Something went wrong';
    if (err.code == 'cancelled') {
      message = 'Transaction cancelled';
    }

    return new StripeTransactionResponse(
        message: message,
        success: false
    );
  }

  static Future<Map<String, dynamic>> createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      var response = await http.post(
         Uri.parse(StripeService.paymentApiUrl),
          body: body,
          headers: StripeService.headers
      );
      return jsonDecode(response.body);
    } catch (err) {
      print('err charging user: ${err.toString()}');
    }
    return null;
  }
}
