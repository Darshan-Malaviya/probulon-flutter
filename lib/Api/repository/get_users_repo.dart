import 'package:Probulon/Api/api_consts.dart';

import '../api_call.dart';

class getUserRepo {
  Future<dynamic> getUsers() async {
    Map<String, String> requestHeader = {
      'Content-Type': 'application/json',
    };
    String url = ApiConsts.getUsers;
    final response = ApiCall.callGetApi(
      url,
      requestHeader,
    );
    return response;
  }
}
