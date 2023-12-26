import 'dart:convert';

GetbyIdResponseModel getbyIdResponseModelFromJson(String str) =>
    GetbyIdResponseModel.fromJson(json.decode(str));

String getbyIdResponseModelToJson(GetbyIdResponseModel data) =>
    json.encode(data.toJson());

class GetbyIdResponseModel {
  bool isSuccess;
  String status;
  String message;
  Data data;
  Meta meta;

  GetbyIdResponseModel({
    required this.isSuccess,
    required this.status,
    required this.message,
    required this.data,
    required this.meta,
  });

  factory GetbyIdResponseModel.fromJson(Map<String, dynamic> json) =>
      GetbyIdResponseModel(
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
  String clientId;
  String collaborator;
  String name;
  String surname;
  String lastSurname;
  String mobile;
  String secondaryMobile;
  String email;
  String secondaryEmail;
  int status;
  String statusText;
  int taxStatus;
  String taxStatusText;
  int documentType;
  String documentTypeText;
  String idNumber;
  List<String> devices;
  String gender;
  int genderType;
  bool isAdmin;
  int userType;
  String userTypeText;
  String postalCode;
  String country;
  String town;
  dynamic startDate;
  dynamic terminationDate;
  String taxAddress;
  String notes;
  String scheduleTime;
  String timezone;
  DateTime createdAt;
  DateTime updatedAt;
  String mpin;

  Data({
    required this.id,
    required this.clientId,
    required this.collaborator,
    required this.name,
    required this.surname,
    required this.lastSurname,
    required this.mobile,
    required this.secondaryMobile,
    required this.email,
    required this.secondaryEmail,
    required this.status,
    required this.statusText,
    required this.taxStatus,
    required this.taxStatusText,
    required this.documentType,
    required this.documentTypeText,
    required this.idNumber,
    required this.devices,
    required this.gender,
    required this.genderType,
    required this.isAdmin,
    required this.userType,
    required this.userTypeText,
    required this.postalCode,
    required this.country,
    required this.town,
    required this.startDate,
    required this.terminationDate,
    required this.taxAddress,
    required this.notes,
    required this.scheduleTime,
    required this.timezone,
    required this.createdAt,
    required this.updatedAt,
    required this.mpin,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"] ?? "",
        clientId: json["clientId"] ?? "",
        collaborator: json["collaborator"] ?? "",
        name: json["name"] ?? "",
        surname: json["surname"] ?? "",
        lastSurname: json["lastSurname"] ?? "",
        mobile: json["mobile"] ?? "",
        secondaryMobile: json["secondaryMobile"] ?? "",
        email: json["email"] ?? "",
        secondaryEmail: json["secondaryEmail"] ?? "",
        status: json["status"] ?? "",
        statusText: json["statusText"] ?? "",
        taxStatus: json["taxStatus"] ?? "",
        taxStatusText: json["taxStatusText"] ?? "",
        documentType: json["documentType"] ?? "",
        documentTypeText: json["documentTypeText"] ?? "",
        idNumber: json["idNumber"] ?? "",
        devices: List<String>.from(json["devices"].map((x) => x)),
        gender: json["gender"] ?? "",
        genderType: json["genderType"] ?? "",
        isAdmin: json["isAdmin"] ?? "",
        userType: json["userType"] ?? "",
        userTypeText: json["userTypeText"] ?? "",
        postalCode: json["postalCode"] ?? "",
        country: json["country"] ?? "",
        town: json["town"] ?? "",
        startDate: json["startDate"] ?? "",
        terminationDate: json["terminationDate"] ?? "",
        taxAddress: json["taxAddress"] ?? "",
        notes: json["notes"] ?? "",
        scheduleTime: json["scheduleTime"] ?? "",
        timezone: json["timezone"] ?? "",
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        mpin: json["mpin"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "clientId": clientId,
        "collaborator": collaborator,
        "name": name,
        "surname": surname,
        "lastSurname": lastSurname,
        "mobile": mobile,
        "secondaryMobile": secondaryMobile,
        "email": email,
        "secondaryEmail": secondaryEmail,
        "status": status,
        "statusText": statusText,
        "taxStatus": taxStatus,
        "taxStatusText": taxStatusText,
        "documentType": documentType,
        "documentTypeText": documentTypeText,
        "idNumber": idNumber,
        "devices": List<dynamic>.from(devices.map((x) => x)),
        "gender": gender,
        "genderType": genderType,
        "isAdmin": isAdmin,
        "userType": userType,
        "userTypeText": userTypeText,
        "postalCode": postalCode,
        "country": country,
        "town": town,
        "startDate": startDate,
        "terminationDate": terminationDate,
        "taxAddress": taxAddress,
        "notes": notes,
        "scheduleTime": scheduleTime,
        "timezone": timezone,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "mpin": mpin,
      };
}

class Meta {
  Meta();

  factory Meta.fromJson(Map<String, dynamic> json) => Meta();

  Map<String, dynamic> toJson() => {};
}
