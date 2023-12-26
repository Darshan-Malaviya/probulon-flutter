import 'dart:developer';

import 'package:Probulon/Api/api_consts.dart';
import 'package:Probulon/Api/api_handlers.dart';
import 'package:Probulon/Api/response_model/update_lock_status_by_response_model.dart';

class UpdateLockStatusByRepo {
  static Future updatelockStatusByRepo(
      {required Map<String, dynamic> body, Map<String, String>? header}) async {
    var response = await ApiService().getResponse(
        apiType: APIType.aPost,
        url: ApiConsts.updateLockStatusBy,
        body: body,
        header: header);
    UpdateLockStatusByResponseModel updateLockStatusByResponseModel =
        UpdateLockStatusByResponseModel.fromJson(response);
    log('-----------------------${ApiConsts.updateLockStatusBy}');
    return updateLockStatusByResponseModel;
  }
}
