class AuthModel {
  AuthModel({
    this.authToken,
  });
  String? authToken;

  AuthModel.fromJson(Map<String, dynamic> json) {
    authToken = json['auth_token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['auth_token'] = authToken;
    return _data;
  }
}
