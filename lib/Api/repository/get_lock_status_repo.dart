import 'dart:developer';

import 'package:Probulon/Api/api_consts.dart';
import 'package:Probulon/Api/api_handlers.dart';
import 'package:Probulon/Api/response_model/get_lock_status_response_model.dart';

class GetLockStatusRepo {
  static Future getlockStatusRepo(
      {required Map<String, dynamic> body, Map<String, String>? header}) async {
    var response = await ApiService().getResponse(
        apiType: APIType.aPost,
        url: ApiConsts.getLockStatus,
        body: body,
        header: header);
    GetLockStatusResponseModel getLockStatusResponseModel =
        GetLockStatusResponseModel.fromJson(response);
    log('-----------------------${ApiConsts.getLockStatus}');
    return getLockStatusResponseModel;
  }
}
