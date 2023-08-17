// To parse this JSON data, do
//
//     final featureScreenModel = featureScreenModelFromJson(jsonString);

import 'dart:convert';

FeatureScreenModel featureScreenModelFromJson(String str) =>
    FeatureScreenModel.fromJson(json.decode(str));

String featureScreenModelToJson(FeatureScreenModel data) =>
    json.encode(data.toJson());

class FeatureScreenModel {
  final String message;
  final Data data;
  final int status;

  FeatureScreenModel({
    required this.message,
    required this.data,
    required this.status,
  });

  factory FeatureScreenModel.fromJson(Map<String, dynamic> json) =>
      FeatureScreenModel(
        message: json["Message"],
        data: Data.fromJson(json["data"]),
        status: json["Status"],
      );

  Map<String, dynamic> toJson() => {
        "Message": message,
        "data": data.toJson(),
        "Status": status,
      };
}

class Data {
  final int id;
  final String name;
  final String description;
  final int price;
  final String discountType;
  final String coverImage;
  final String productImage;
  final List<dynamic> productCategory;
  final List<dynamic> productSubCategory;
  final List<dynamic> feaature;
  final List<dynamic> subFeaature;
  final String productDesignDuration;
  final String productProfessinalPrototype;
  final int productMvpDuration;
  final String productBuildDuration;
  final String productRoadmap;
  final int status;

  Data({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.discountType,
    required this.coverImage,
    required this.productImage,
    required this.productCategory,
    required this.productSubCategory,
    required this.feaature,
    required this.subFeaature,
    required this.productDesignDuration,
    required this.productProfessinalPrototype,
    required this.productMvpDuration,
    required this.productBuildDuration,
    required this.productRoadmap,
    required this.status,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        discountType: json["discount_type"],
        coverImage: json["cover_image"],
        productImage: json["product_image"],
        productCategory:
            List<dynamic>.from(json["product_category"].map((x) => x)),
        productSubCategory:
            List<dynamic>.from(json["product_sub_category"].map((x) => x)),
        feaature: List<dynamic>.from(json["feaature"].map((x) => x)),
        subFeaature: List<dynamic>.from(json["sub_feaature"].map((x) => x)),
        productDesignDuration: json["product_design_duration"],
        productProfessinalPrototype: json["product_professinal_prototype"],
        productMvpDuration: json["product_mvp_duration"],
        productBuildDuration: json["product_build_duration"],
        productRoadmap: json["product_roadmap"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "discount_type": discountType,
        "cover_image": coverImage,
        "product_image": productImage,
        "product_category": List<dynamic>.from(productCategory.map((x) => x)),
        "product_sub_category":
            List<dynamic>.from(productSubCategory.map((x) => x)),
        "feaature": List<dynamic>.from(feaature.map((x) => x)),
        "sub_feaature": List<dynamic>.from(subFeaature.map((x) => x)),
        "product_design_duration": productDesignDuration,
        "product_professinal_prototype": productProfessinalPrototype,
        "product_mvp_duration": productMvpDuration,
        "product_build_duration": productBuildDuration,
        "product_roadmap": productRoadmap,
        "status": status,
      };
}
