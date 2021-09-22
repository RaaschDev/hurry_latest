import 'dart:convert';
import 'package:hurry/app/shared/models/auth_model.dart';
import 'package:http/http.dart' as http;
import 'package:hurry/app/shared/models/user_model.dart';
import 'package:hurry/app/src/constants.dart';

class AuthRepository {
  Future<AuthModel> login(password, email) async {
    Map<String, String> headers = {"Content-Type": "application/json"};
    var response = await http.post(Constants.authUrl, headers: headers, body: json.encode({"password": password, "email": email}));
    try {
      if (response.statusCode != 200) {
        print(response.statusCode);
        return AuthModel();
      } else {
        var dec = json.decode(response.body);
        AuthModel authModel = AuthModel.fromJson(dec);
        print(response.statusCode);
        print(authModel.authToken);
        return authModel;
      }
    } catch (e) {
      return AuthModel();
    }
  }

  Future<UserModel> getMe(token) async {
    Map<String, String> headers = {"Content-Type": "application/json", "Authorization": "Token $token"};
    var response = await http.get(Constants.meUrl, headers: headers);
    try {
      var dec = json.decode(response.body);
      UserModel userModel = UserModel.fromJson(dec);
      return userModel;
    } catch (e) {
      return UserModel();
    }
  }
}
