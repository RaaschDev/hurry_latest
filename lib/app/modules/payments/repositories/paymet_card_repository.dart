import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:hurry/app/modules/payments/models/payment_error.dart';
import 'package:hurry/app/modules/payments/models/payment_model.dart';

class PaymentCardRepository {
  static Future<PaymentModel?> payment(
      {required reference,
      required motivo,
      required value,
      required cardNumber,
      required cardExpMonth,
      required cardExpYear,
      required cardCvc,
      required cardName,
      required tId,
      required tType,
      required tQuantity,
      required wallet,
      required user,
      required eventId}) async {
    var url = Uri.parse('https://sandbox.api.pagseguro.com/charges');
    var url2 = Uri.parse('http://178.128.154.39:8000/api/sale/tickets/');
    var url3 = Uri.parse('http://178.128.154.39:8000/api/mobile/myevents/');
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'A54DD918ABD14C97B34CDD9A2A99193F',
      'x-api-version': '4.0',
    };
    Map<String, String> headers2 = {
      'Content-Type': 'application/json',
      // 'Authorization': 'A54DD918ABD14C97B34CDD9A2A99193F',
    };
    var body = {
      "reference_id": "$reference",
      "description": "$motivo",
      "amount": {"value": value, "currency": "BRL"},
      "payment_method": {
        "type": "CREDIT_CARD",
        "installments": 1,
        "capture": true,
        "card": {
          "number": "$cardNumber",
          "exp_month": "$cardExpMonth",
          "exp_year": "$cardExpYear",
          "security_code": "$cardCvc",
          "holder": {"name": "$cardName"}
        }
      }
    };

    var response = await http.post(url, headers: headers, body: json.encode(body));
    var dec = json.decode(response.body);
    print(response.statusCode);
    if (response.statusCode == 400) {
      PaymentModelError error = PaymentModelError.fromJson(dec);
      print(error.errorMessages?.first?.message);
    } else {
      PaymentModel payment = PaymentModel.fromJson(dec);
      var pay = await http.post(url2, headers: headers2, body: json.encode({"ticket": tId, "ticket_type": tType, "payment_type": 'card', "quantity": tQuantity, "wallet": wallet}));

      if (pay.statusCode == 201) {
        var event = await http.post(url3, headers: headers2, body: json.encode({"user": user, "event": eventId}));
        Modular.to.pushNamedAndRemoveUntil('/home', (_) => false);
      }
      print(payment.paymentResponse?.message);
      print(payment.amount?.value);
      print(payment.paidAt);
    }
  }
}
