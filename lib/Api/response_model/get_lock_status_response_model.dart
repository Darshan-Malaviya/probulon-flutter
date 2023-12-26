// To parse this JSON data, do
//
//     final getLockStatusResponseModel = getLockStatusResponseModelFromJson(jsonString);

import 'dart:convert';

GetLockStatusResponseModel getLockStatusResponseModelFromJson(String str) =>
    GetLockStatusResponseModel.fromJson(json.decode(str));

String getLockStatusResponseModelToJson(GetLockStatusResponseModel data) =>
    json.encode(data.toJson());

class GetLockStatusResponseModel {
  bool isSuccess;
  String status;
  String message;
  Data data;
  Meta meta;

  GetLockStatusResponseModel({
    required this.isSuccess,
    required this.status,
    required this.message,
    required this.data,
    required this.meta,
  });

  factory GetLockStatusResponseModel.fromJson(Map<String, dynamic> json) =>
      GetLockStatusResponseModel(
        isSuccess: json["isSuccess"] ?? "",
        status: json["status"] ?? "",
        message: json["message"] ?? "",
        data: Data.fromJson(json["data"]),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "status": status,
        "message": message,
        "data": data.toJson(),
        "meta": meta.toJson(),
      };
}

class Data {
  String deviceId;
  String updateLockStatusBy;
  bool isLocked;

  Data({
    required this.deviceId,
    required this.updateLockStatusBy,
    required this.isLocked,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        deviceId: json["deviceId"] ?? "",
        updateLockStatusBy: json["updateLockStatusBy"] ?? "",
        isLocked: json["isLocked"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "deviceId": deviceId,
        "updateLockStatusBy": updateLockStatusBy,
        "isLocked": isLocked,
      };
}

class Meta {
  Meta();

  factory Meta.fromJson(Map<String, dynamic> json) => Meta();

  Map<String, dynamic> toJson() => {};
}
