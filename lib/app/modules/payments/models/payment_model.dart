class PaymentModelPaymentMethodCardHolder {
  String? name;

  PaymentModelPaymentMethodCardHolder({
    this.name,
  });
  PaymentModelPaymentMethodCardHolder.fromJson(Map<String, dynamic> json) {
    name = json["name"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["name"] = name;
    return data;
  }
}

class PaymentModelPaymentMethodCard {
  String? brand;
  String? firstDigits;
  String? lastDigits;
  String? expMonth;
  String? expYear;
  PaymentModelPaymentMethodCardHolder? holder;

  PaymentModelPaymentMethodCard({
    this.brand,
    this.firstDigits,
    this.lastDigits,
    this.expMonth,
    this.expYear,
    this.holder,
  });
  PaymentModelPaymentMethodCard.fromJson(Map<String, dynamic> json) {
    brand = json["brand"]?.toString();
    firstDigits = json["first_digits"]?.toString();
    lastDigits = json["last_digits"]?.toString();
    expMonth = json["exp_month"]?.toString();
    expYear = json["exp_year"]?.toString();
    holder = (json["holder"] != null) ? PaymentModelPaymentMethodCardHolder.fromJson(json["holder"]) : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["brand"] = brand;
    data["first_digits"] = firstDigits;
    data["last_digits"] = lastDigits;
    data["exp_month"] = expMonth;
    data["exp_year"] = expYear;
    if (holder != null) {
      data["holder"] = holder!.toJson();
    }
    return data;
  }
}

class PaymentModelPaymentMethod {
  String? type;
  int? installments;
  bool? capture;
  PaymentModelPaymentMethodCard? card;
  String? softDescriptor;

  PaymentModelPaymentMethod({
    this.type,
    this.installments,
    this.capture,
    this.card,
    this.softDescriptor,
  });
  PaymentModelPaymentMethod.fromJson(Map<String, dynamic> json) {
    type = json["type"]?.toString();
    installments = json["installments"]?.toInt();
    capture = json["capture"];
    card = (json["card"] != null) ? PaymentModelPaymentMethodCard.fromJson(json["card"]) : null;
    softDescriptor = json["soft_descriptor"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["type"] = type;
    data["installments"] = installments;
    data["capture"] = capture;
    if (card != null) {
      data["card"] = card!.toJson();
    }
    data["soft_descriptor"] = softDescriptor;
    return data;
  }
}

class PaymentModelPaymentResponse {
  String? code;
  String? message;
  String? reference;

  PaymentModelPaymentResponse({
    this.code,
    this.message,
    this.reference,
  });
  PaymentModelPaymentResponse.fromJson(Map<String, dynamic> json) {
    code = json["code"]?.toString();
    message = json["message"]?.toString();
    reference = json["reference"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["code"] = code;
    data["message"] = message;
    data["reference"] = reference;
    return data;
  }
}

class PaymentModelAmountSummary {
  int? total;
  int? paid;
  int? refunded;

  PaymentModelAmountSummary({
    this.total,
    this.paid,
    this.refunded,
  });
  PaymentModelAmountSummary.fromJson(Map<String, dynamic> json) {
    total = json["total"]?.toInt();
    paid = json["paid"]?.toInt();
    refunded = json["refunded"]?.toInt();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["total"] = total;
    data["paid"] = paid;
    data["refunded"] = refunded;
    return data;
  }
}

class PaymentModelAmount {
  int? value;
  String? currency;
  PaymentModelAmountSummary? summary;

  PaymentModelAmount({
    this.value,
    this.currency,
    this.summary,
  });
  PaymentModelAmount.fromJson(Map<String, dynamic> json) {
    value = json["value"]?.toInt();
    currency = json["currency"]?.toString();
    summary = (json["summary"] != null) ? PaymentModelAmountSummary.fromJson(json["summary"]) : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["value"] = value;
    data["currency"] = currency;
    if (summary != null) {
      data["summary"] = summary!.toJson();
    }
    return data;
  }
}

class PaymentModel {
  String? id;
  String? referenceId;
  String? status;
  String? createdAt;
  String? paidAt;
  String? description;
  PaymentModelAmount? amount;
  PaymentModelPaymentResponse? paymentResponse;
  PaymentModelPaymentMethod? paymentMethod;

  PaymentModel({
    this.id,
    this.referenceId,
    this.status,
    this.createdAt,
    this.paidAt,
    this.description,
    this.amount,
    this.paymentResponse,
    this.paymentMethod,
  });
  PaymentModel.fromJson(Map<String, dynamic> json) {
    id = json["id"]?.toString();
    referenceId = json["reference_id"]?.toString();
    status = json["status"]?.toString();
    createdAt = json["created_at"]?.toString();
    paidAt = json["paid_at"]?.toString();
    description = json["description"]?.toString();
    amount = (json["amount"] != null) ? PaymentModelAmount.fromJson(json["amount"]) : null;
    paymentResponse = (json["payment_response"] != null) ? PaymentModelPaymentResponse.fromJson(json["payment_response"]) : null;
    paymentMethod = (json["payment_method"] != null) ? PaymentModelPaymentMethod.fromJson(json["payment_method"]) : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["reference_id"] = referenceId;
    data["status"] = status;
    data["created_at"] = createdAt;
    data["paid_at"] = paidAt;
    data["description"] = description;
    if (amount != null) {
      data["amount"] = amount!.toJson();
    }
    if (paymentResponse != null) {
      data["payment_response"] = paymentResponse!.toJson();
    }
    if (paymentMethod != null) {
      data["payment_method"] = paymentMethod!.toJson();
    }
    return data;
  }
}
