// To parse this JSON data, do
//
//     final logInResponseModel = logInResponseModelFromJson(jsonString);

import 'dart:convert';

LogInResponseModel logInResponseModelFromJson(String str) =>
    LogInResponseModel.fromJson(json.decode(str));

String logInResponseModelToJson(LogInResponseModel data) =>
    json.encode(data.toJson());

class LogInResponseModel {
  bool isSuccess;
  String status;
  String message;
  Data data;

  LogInResponseModel({
    required this.isSuccess,
    required this.status,
    required this.message,
    required this.data,
  });

  factory LogInResponseModel.fromJson(Map<String, dynamic> json) =>
      LogInResponseModel(
        isSuccess: json["isSuccess"],
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  String token;

  Data({
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"] != null ? json["token"] : "",
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
