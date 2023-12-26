/*import 'dart:convert';

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
}*/
import 'dart:developer';

import 'package:Probulon/Api/api_consts.dart';
import 'package:Probulon/Api/api_handlers.dart';
import 'package:Probulon/Api/response_model/log_in_response_model.dart';

class LogInRepo {
  static Future logInRepo({required Map<String, dynamic> body}) async {
    var response = await ApiService().getResponse(
        apiType: APIType.aPost, url: ApiConsts.loginUrl, body: body);
    LogInResponseModel logInResponseModel =
        LogInResponseModel.fromJson(response);
    log('-----------------------${ApiConsts.loginUrl}');
    return logInResponseModel;
  }
}
