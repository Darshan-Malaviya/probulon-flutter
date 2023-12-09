import 'package:Probulon/Api/response_model/get_users_response_model.dart';
import 'package:Probulon/utils/api_consts.dart';

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
    getUserResponseModelFromJson(response as String);
    return response;
  }
}
