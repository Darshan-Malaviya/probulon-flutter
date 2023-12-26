import 'dart:convert';
import 'dart:developer';

import 'package:Probulon/screens/auth/log_in_screen.dart';
import 'package:Probulon/utils/pref_services.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

enum APIType { aGet, aPost, aImageForm }

class ApiService {
  var response;
  Future<dynamic> getResponse({
    required APIType apiType,
    required String url,
    Map<String, dynamic>? body,
    Map<String, String>? header,
  }) async {
    try {
      if (apiType == APIType.aGet) {
        final result = await http.get(Uri.parse(url), headers: header);
        response = returnResponse(result.statusCode, result.body);

        log("resp${result.body}");
      } else if (apiType == APIType.aPost) {
        final result =
            await http.post(Uri.parse(url), body: body, headers: header);
        response = returnResponse(result.statusCode, result.body);

        log('result.statusCode-------->>>>>>${result.statusCode}');
      } else if (apiType == APIType.aImageForm) {
        final dio1 = dio.Dio();
        final formData = dio.FormData.fromMap(body!);
        log('formData------$body');
        final result = await dio1.postUri(Uri.parse(url),
            data: formData, options: dio.Options(headers: header));

        response = returnResponse(result.statusCode!, jsonEncode(result.data));
        log('result.statusCode-------->>>>>>${result.statusCode}');
      }
    } catch (error) {
      return print('ERROR====>[$error]');
    }
    return response;
  }

  returnResponse(int status, String result) {
    switch (status) {
      case 200:
        return jsonDecode(result);
      case 201:
        return jsonDecode(result);
      case 400:
        return jsonDecode(result);
      case 401:
        return {
          PrefService.setValue('isLogged', false),
          Get.offAll(LoginScreen())
        };
      case 403:
        return jsonDecode(result);
      case 404:
        return jsonDecode(result);
      case 500:
        return Get.offAll(LoginScreen());
      default:
      // throw FetchDataException('Internal Server Error');
    }
  }
}
