// To parse this JSON data, do
//
//     final platformDataModel = platformDataModelFromJson(jsonString);

import 'dart:convert';

PlatformDataModel platformDataModelFromJson(String str) =>
    PlatformDataModel.fromJson(json.decode(str));

String platformDataModelToJson(PlatformDataModel data) =>
    json.encode(data.toJson());

class PlatformDataModel {
  final String message;
  final List<Datum> data;
  final int status;

  PlatformDataModel({
    required this.message,
    required this.data,
    required this.status,
  });

  factory PlatformDataModel.fromJson(Map<String, dynamic> json) =>
      PlatformDataModel(
        message: json["Message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        status: json["Status"],
      );

  Map<String, dynamic> toJson() => {
        "Message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "Status": status,
      };
}

class Datum {
  final int platformId;
  final String platformName;
  final String platformImage;
  final String status;

  Datum({
    required this.platformId,
    required this.platformName,
    required this.platformImage,
    required this.status,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        platformId: json["platform_id"],
        platformName: json["platform_name"],
        platformImage: json["platform_image"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "platform_id": platformId,
        "platform_name": platformName,
        "platform_image": platformImage,
        "status": status,
      };
}
