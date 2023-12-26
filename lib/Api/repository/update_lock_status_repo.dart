import 'dart:developer';

import 'package:Probulon/Api/api_consts.dart';
import 'package:Probulon/Api/api_handlers.dart';
import 'package:Probulon/Api/response_model/update_lock_status_response_model.dart';

class UpdateLockStatusRepo {
  static Future updatelockStatusRepo(
      {required Map<String, dynamic> body, Map<String, String>? header}) async {
    var response = await ApiService().getResponse(
        apiType: APIType.aPost,
        url: ApiConsts.updateLockStatus,
        body: body,
        header: header);
    UpdateLockStatusResponseModel updateLockStatusResponseModel =
        UpdateLockStatusResponseModel.fromJson(response);
    log('-----------------------${ApiConsts.updateLockStatus}');
    return updateLockStatusResponseModel;
  }
}
