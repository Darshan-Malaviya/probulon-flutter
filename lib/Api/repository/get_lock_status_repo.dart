import 'dart:convert';

import 'package:Probulon/Api/api_consts.dart';
import 'package:Probulon/utils/pref_services.dart';

import '../api_call.dart';

class updatelockStatusBy {
  Future<dynamic> updateLockStatusBy(Map<String, dynamic> reqBody) async {
    final token = PrefService.getString('token');
    Map<String, String> requestHeader = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    String url = ApiConsts.updateLockStatusBy;
    final response =
        ApiCall.callPostApi(url, requestHeader, jsonEncode(reqBody));

    return response;
  }
}
