import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiCall {
  static Future<dynamic> callPostApi(
      String url, Map<String, String> header, var request) async {
    var response =
        await http.post(Uri.parse(url), body: request, headers: header);
    print("Url $url");
    final responseData = jsonDecode(response.body);
    return responseData;
  }

  static Future<dynamic> callGetApi(
      String url, Map<String, String> header) async {
    var response = await http.get(Uri.parse(url), headers: header);
    print("Url $url");
    final responseData = jsonDecode(response.body);
    return responseData;
  }
}
