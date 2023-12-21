import 'dart:convert';

import 'package:Probulon/Api/api_consts.dart';

import '../api_call.dart';

class LoginRepo {
  Future<dynamic> callLoginApi(email, password) async {
    Map<String, String> requestHeader = {
      'Content-Type': 'application/json',
    };
    var requestBody = {
      'email': email,
      'password': password,
    };
    String url = ApiConsts.loginUrl;
    final response =
        ApiCall.callPostApi(url, requestHeader, jsonEncode(requestBody));

    return response;
  }
}
