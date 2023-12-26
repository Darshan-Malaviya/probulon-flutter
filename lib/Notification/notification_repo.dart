import 'dart:convert';

import 'package:Probulon/Api/api_consts.dart';
import 'package:Probulon/common/string_res.dart';
import 'package:http/http.dart' as http;

class SendNotification {
  Future sendNotification(body) async {
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'key=${StringRes.serverKey}',
    };

    final Map<String, dynamic> requestBody = {
      "to":
          "ca1I3ZYuS7yNh7RTZV157j:APA91bFWhisdYTBpP7GhdYsu_GFpu1xSMdue8ItYjzmqPL77tt0Zln81-_cMfrHC1EnMRLpbqCNQpcF-JpaBNHSU2DdOpRqLVXEvSOK0nSGR1g2sIjBsmpP1p0kuNuqzQSntNH_syjEw",
      "notification": {
        "title": "Probulon",
        "body": body.toString(),
      }
    };

    final http.Response response = await http.post(
      Uri.parse(ApiConsts.notificationUrl),
      headers: headers,
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200) {
      print('Response: ${response.body}');
    } else {
      print('Error: ${response.statusCode}');
      print('Response: ${response.body}');
    }
  }
}
