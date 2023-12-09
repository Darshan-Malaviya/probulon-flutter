// To parse this JSON data, do
//
//     final getUserResponseModel = getUserResponseModelFromJson(jsonString);

import 'dart:convert';

GetUserResponseModel getUserResponseModelFromJson(String str) =>
    GetUserResponseModel.fromJson(json.decode(str));

String getUserResponseModelToJson(GetUserResponseModel data) =>
    json.encode(data.toJson());

class GetUserResponseModel {
  bool isSuccess;
  String status;
  String message;
  List<Datum> data;
  Meta meta;

  GetUserResponseModel({
    required this.isSuccess,
    required this.status,
    required this.message,
    required this.data,
    required this.meta,
  });

  factory GetUserResponseModel.fromJson(Map<String, dynamic> json) =>
      GetUserResponseModel(
        isSuccess: json["isSuccess"],
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "meta": meta.toJson(),
      };
}

class Datum {
  String id;
  String firstName;
  String lastName;
  String email;
  String? secondaryEmail;
  String deviceId;
  String gender;
  int genderType;
  bool isAdmin;
  int status;
  String statusText;
  int userType;
  int? position;
  String? positionText;
  int? collaborator;
  String? collaboratorText;
  DateTime createdAt;
  DateTime updatedAt;

  Datum({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.secondaryEmail,
    required this.deviceId,
    required this.gender,
    required this.genderType,
    required this.isAdmin,
    required this.status,
    required this.statusText,
    required this.userType,
    this.position,
    this.positionText,
    this.collaborator,
    this.collaboratorText,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        secondaryEmail: json["secondaryEmail"],
        deviceId: json["deviceId"],
        gender: json["gender"],
        genderType: json["genderType"],
        isAdmin: json["isAdmin"],
        status: json["status"],
        statusText: json["statusText"],
        userType: json["userType"],
        position: json["position"],
        positionText: json["positionText"],
        collaborator: json["collaborator"],
        collaboratorText: json["collaboratorText"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "secondaryEmail": secondaryEmail,
        "deviceId": deviceId,
        "gender": gender,
        "genderType": genderType,
        "isAdmin": isAdmin,
        "status": status,
        "statusText": statusText,
        "userType": userType,
        "position": position,
        "positionText": positionText,
        "collaborator": collaborator,
        "collaboratorText": collaboratorText,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class Meta {
  int pageNumber;
  int pageSize;
  int totalCount;
  bool prevPage;
  bool nextPage;
  int totalPages;

  Meta({
    required this.pageNumber,
    required this.pageSize,
    required this.totalCount,
    required this.prevPage,
    required this.nextPage,
    required this.totalPages,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        pageNumber: json["pageNumber"],
        pageSize: json["pageSize"],
        totalCount: json["totalCount"],
        prevPage: json["prevPage"],
        nextPage: json["nextPage"],
        totalPages: json["totalPages"],
      );

  Map<String, dynamic> toJson() => {
        "pageNumber": pageNumber,
        "pageSize": pageSize,
        "totalCount": totalCount,
        "prevPage": prevPage,
        "nextPage": nextPage,
        "totalPages": totalPages,
      };
}
