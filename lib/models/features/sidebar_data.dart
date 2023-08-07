// To parse this JSON data, do
//
//     final featureSidebarModel = featureSidebarModelFromJson(jsonString);

import 'dart:convert';

FeatureSidebarModel featureSidebarModelFromJson(String str) =>
    FeatureSidebarModel.fromJson(json.decode(str));

String featureSidebarModelToJson(FeatureSidebarModel data) =>
    json.encode(data.toJson());

class FeatureSidebarModel {
  final String message;
  final List<Datum> data;
  final int status;

  FeatureSidebarModel({
    required this.message,
    required this.data,
    required this.status,
  });

  factory FeatureSidebarModel.fromJson(Map<String, dynamic> json) =>
      FeatureSidebarModel(
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
  final int categoryId;
  final String featureName;
  final String status;
  final String description;
  final List<SubFeaature> subFeaature;

  Datum({
    required this.categoryId,
    required this.featureName,
    required this.status,
    required this.description,
    required this.subFeaature,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        categoryId: json["category_id"],
        featureName: json["feature_name"],
        status: json["status"],
        description: json["description"],
        subFeaature: List<SubFeaature>.from(
            json["sub_feaature"].map((x) => SubFeaature.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "feature_name": featureName,
        "status": status,
        "description": description,
        "sub_feaature": List<dynamic>.from(subFeaature.map((x) => x.toJson())),
      };
}

class SubFeaature {
  final int subFeatureId;
  final int featureId;
  final String subFeature;
  final int subPrice;
  final int subDay;
  final String status;

  SubFeaature({
    required this.subFeatureId,
    required this.featureId,
    required this.subFeature,
    required this.subPrice,
    required this.subDay,
    required this.status,
  });

  factory SubFeaature.fromJson(Map<String, dynamic> json) => SubFeaature(
        subFeatureId: json["sub_feature_id"],
        featureId: json["feature_id"],
        subFeature: json["sub_feature"],
        subPrice: json["sub_price"],
        subDay: json["sub_day"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "sub_feature_id": subFeatureId,
        "feature_id": featureId,
        "sub_feature": subFeature,
        "sub_price": subPrice,
        "sub_day": subDay,
        "status": status,
      };
}
