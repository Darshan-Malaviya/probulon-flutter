import 'dart:convert';

import 'package:Probulon/Api/api_consts.dart';
import 'package:Probulon/common/string_res.dart';
import 'package:http/http.dart' as http;

class SendNotification {
  Future sendNotification({required Map<String, dynamic> requestBody}) async {
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'key=${StringRes.serverKey}',
    };

    final http.Response response = await http.post(
      Uri.parse(ApiConsts.notificationUrl),
      headers: headers,
      body: jsonEncode(requestBody),
    );

    if (response.statusCode != 200) {
      print('Error: ${response.statusCode}');
      print('Response: ${response.body}');
    }
  }
}
