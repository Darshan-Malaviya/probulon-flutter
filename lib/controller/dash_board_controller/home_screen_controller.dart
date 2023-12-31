import 'package:Probulon/Api/api_response.dart';
import 'package:Probulon/Api/repository/get_lock_status_repo.dart';
import 'package:Probulon/Api/repository/update_lock_status_by_repo.dart';
import 'package:Probulon/Api/repository/update_lock_status_repo.dart';
import 'package:Probulon/Api/response_model/get_lock_status_response_model.dart';
import 'package:Probulon/Api/response_model/update_lock_status_by_response_model.dart';
import 'package:Probulon/Api/response_model/update_lock_status_response_model.dart';
import 'package:Probulon/utils/pref_services.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  var responseData;
  var lockStatus;
  bool isIconChanges = false;
  int index = 0;
  List name = [
    "Manual",
    "Automatic",
  ];

  final token = PrefService.getString('token');

  /// Get Lock Status

  ApiResponse _apiResponseGetLockStatus =
      ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponseGetLockStatus => _apiResponseGetLockStatus;

  Future<void> getLockStatusviewModel(
      {required Map<String, dynamic> body,
      required Map<String, String> header}) async {
    _apiResponseGetLockStatus = ApiResponse.loading(message: 'Loading');
    update(['home']);

    GetLockStatusResponseModel response =
        await GetLockStatusRepo.getlockStatusRepo(body: body, header: header);
    _apiResponseGetLockStatus = ApiResponse.complete(response);

    update(['home']);
  }

  /// Update lock Status By Automatic or Manual

  ApiResponse _apiResponseUpdateLockStatusBy =
      ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponseUpdateLockStatusBy =>
      _apiResponseUpdateLockStatusBy;

  Future<void> updateLockStatusByviewModel(
      {required Map<String, dynamic> body,
      required Map<String, String> header}) async {
    _apiResponseUpdateLockStatusBy = ApiResponse.loading(message: 'Loading');
    update(['home']);

    UpdateLockStatusByResponseModel response =
        await UpdateLockStatusByRepo.updatelockStatusByRepo(
            body: body, header: header);
    _apiResponseUpdateLockStatusBy = ApiResponse.complete(response);

    update(['home']);
  }

  /// Update lock Status

  ApiResponse _apiResponseUpdateLockStatus =
      ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponseUpdateLockStatus => _apiResponseUpdateLockStatusBy;

  Future<void> updateLockStatusviewModel(
      {required Map<String, dynamic> body,
      required Map<String, String> header}) async {
    _apiResponseUpdateLockStatus = ApiResponse.loading(message: 'Loading');
    update(['home']);

    UpdateLockStatusResponseModel response =
        await UpdateLockStatusRepo.updatelockStatusRepo(
            body: body, header: header);
    _apiResponseUpdateLockStatus = ApiResponse.complete(response);

    update(['home']);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    final token = PrefService.getString('token');
    getLockStatusviewModel(body: {
      "deviceId": "6575b58a204be2aa8a57113d"
    }, header: {
      'Authorization': 'Bearer $token',
    });
    super.onInit();
  }
}
