import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiCall {
  static Future<dynamic> callPostApi(
      String url, Map<String, String> header, var request) async {
    var response =
        await http.post(Uri.parse(url), body: request, headers: header);
    print("Url $url");
    print("Status Code ${response.statusCode}");
    final responseData = jsonDecode(response.body);
    return responseData;
  }
}
