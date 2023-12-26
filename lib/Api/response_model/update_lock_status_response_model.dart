// To parse this JSON data, do
//
//     final updateLockStatusResponseModel = updateLockStatusResponseModelFromJson(jsonString);

import 'dart:convert';

UpdateLockStatusResponseModel updateLockStatusResponseModelFromJson(
        String str) =>
    UpdateLockStatusResponseModel.fromJson(json.decode(str));

String updateLockStatusResponseModelToJson(
        UpdateLockStatusResponseModel data) =>
    json.encode(data.toJson());

class UpdateLockStatusResponseModel {
  bool isSuccess;
  String status;
  String message;
  Data data;
  Meta meta;

  UpdateLockStatusResponseModel({
    required this.isSuccess,
    required this.status,
    required this.message,
    required this.data,
    required this.meta,
  });

  factory UpdateLockStatusResponseModel.fromJson(Map<String, dynamic> json) =>
      UpdateLockStatusResponseModel(
        isSuccess: json["isSuccess"] ?? false,
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
        isLocked: json["isLocked"] ?? false,
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
