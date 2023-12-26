// To parse this JSON data, do
//
//     final updateLockStatusByResponseModel = updateLockStatusByResponseModelFromJson(jsonString);

import 'dart:convert';

UpdateLockStatusByResponseModel updateLockStatusByResponseModelFromJson(
        String str) =>
    UpdateLockStatusByResponseModel.fromJson(json.decode(str));

String updateLockStatusByResponseModelToJson(
        UpdateLockStatusByResponseModel data) =>
    json.encode(data.toJson());

class UpdateLockStatusByResponseModel {
  bool isSuccess;
  String status;
  String message;
  Data data;
  Meta meta;

  UpdateLockStatusByResponseModel({
    required this.isSuccess,
    required this.status,
    required this.message,
    required this.data,
    required this.meta,
  });

  factory UpdateLockStatusByResponseModel.fromJson(Map<String, dynamic> json) =>
      UpdateLockStatusByResponseModel(
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
  String id;
  String deviceId;
  String updateLockStatusBy;
  bool isLocked;

  Data({
    required this.id,
    required this.deviceId,
    required this.updateLockStatusBy,
    required this.isLocked,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"] ?? "",
        deviceId: json["deviceId"] ?? "",
        updateLockStatusBy: json["updateLockStatusBy"] ?? "",
        isLocked: json["isLocked"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
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
