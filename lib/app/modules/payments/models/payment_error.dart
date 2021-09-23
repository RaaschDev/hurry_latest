class PaymentModelErrorErrorMessages {
  String? code;
  String? message;
  String? description;
  String? parameterName;

  PaymentModelErrorErrorMessages({
    this.code,
    this.message,
    this.description,
    this.parameterName,
  });
  PaymentModelErrorErrorMessages.fromJson(Map<String, dynamic> json) {
    code = json["code"]?.toString();
    message = json["message"]?.toString();
    description = json["description"]?.toString();
    parameterName = json["parameter_name"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["code"] = code;
    data["message"] = message;
    data["description"] = description;
    data["parameter_name"] = parameterName;
    return data;
  }
}

class PaymentModelError {
  List<PaymentModelErrorErrorMessages?>? errorMessages;

  PaymentModelError({
    this.errorMessages,
  });
  PaymentModelError.fromJson(Map<String, dynamic> json) {
    if (json["error_messages"] != null) {
      final v = json["error_messages"];
      final arr0 = <PaymentModelErrorErrorMessages>[];
      v.forEach((v) {
        arr0.add(PaymentModelErrorErrorMessages.fromJson(v));
      });
      errorMessages = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (errorMessages != null) {
      final v = errorMessages;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data["error_messages"] = arr0;
    }
    return data;
  }
}
