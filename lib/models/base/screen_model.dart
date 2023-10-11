// To parse this JSON data, do
//
//     final baseScreenModel = baseScreenModelFromJson(jsonString);

import 'dart:convert';

BaseScreenModel baseScreenModelFromJson(String str) =>
    BaseScreenModel.fromJson(json.decode(str));

String baseScreenModelToJson(BaseScreenModel data) =>
    json.encode(data.toJson());

class BaseScreenModel {
  final String message;
  final List<Datum> data;
  final int status;

  BaseScreenModel({
    required this.message,
    required this.data,
    required this.status,
  });

  factory BaseScreenModel.fromJson(Map<String, dynamic> json) =>
      BaseScreenModel(
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
  final int id;
  final String name;
  final String description;
  final int price;
  final int totalPrice;
  final String discountType;
  final String coverImage;
  final List<String> productImage;
  final List<ProductCategory> productCategory;
  final List<FeaatureElement> feaature;
  final int productDesignDuration;
  final int productProfessinalPrototype;
  final int productMvpDuration;
  final int productBuildDuration;
  final String productPlatform;
  final String productRoadmap;
  final String productCustomStatus;
  final int status;

  Datum({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.totalPrice,
    required this.discountType,
    required this.coverImage,
    required this.productImage,
    required this.productCategory,
    required this.feaature,
    required this.productDesignDuration,
    required this.productProfessinalPrototype,
    required this.productMvpDuration,
    required this.productBuildDuration,
    required this.productPlatform,
    required this.productRoadmap,
    required this.productCustomStatus,
    required this.status,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        totalPrice: json["totalPrice"],
        discountType: json["discount_type"],
        coverImage: json["cover_image"],
        productImage: List<String>.from(json["product_image"].map((x) => x)),
        productCategory: List<ProductCategory>.from(
            json["product_category"].map((x) => ProductCategory.fromJson(x))),
        feaature: List<FeaatureElement>.from(
            json["feaature"].map((x) => FeaatureElement.fromJson(x))),
        productDesignDuration: json["product_design_duration"],
        productProfessinalPrototype: json["product_professinal_prototype"],
        productMvpDuration: json["product_mvp_duration"],
        productBuildDuration: json["product_build_duration"],
        productPlatform: json["product_platform"],
        productRoadmap: json["product_roadmap"],
        productCustomStatus: json["product_custom_status"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "totalPrice": totalPrice,
        "discount_type": discountType,
        "cover_image": coverImage,
        "product_image": List<dynamic>.from(productImage.map((x) => x)),
        "product_category":
            List<dynamic>.from(productCategory.map((x) => x.toJson())),
        "feaature": List<dynamic>.from(feaature.map((x) => x.toJson())),
        "product_design_duration": productDesignDuration,
        "product_professinal_prototype": productProfessinalPrototype,
        "product_mvp_duration": productMvpDuration,
        "product_build_duration": productBuildDuration,
        "product_platform": productPlatform,
        "product_roadmap": productRoadmap,
        "product_custom_status": productCustomStatus,
        "status": status,
      };
}

class FeaatureElement {
  final int featureId;
  final FeaatureFeaature feaature;

  FeaatureElement({
    required this.featureId,
    required this.feaature,
  });

  factory FeaatureElement.fromJson(Map<String, dynamic> json) =>
      FeaatureElement(
        featureId: json["feature_id"],
        feaature: FeaatureFeaature.fromJson(json["feaature"]),
      );

  Map<String, dynamic> toJson() => {
        "feature_id": featureId,
        "feaature": feaature.toJson(),
      };
}

class FeaatureFeaature {
  final int featureId;
  final String featureName;
  final String status;
  final String description;
  final List<SubFeature> subFeature;

  FeaatureFeaature({
    required this.featureId,
    required this.featureName,
    required this.status,
    required this.description,
    required this.subFeature,
  });

  factory FeaatureFeaature.fromJson(Map<String, dynamic> json) =>
      FeaatureFeaature(
        featureId: json["feature_id"],
        featureName: json["feature_name"],
        status: json["status"],
        description: json["description"],
        subFeature: List<SubFeature>.from(
            json["sub_feature"].map((x) => SubFeature.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "feature_id": featureId,
        "feature_name": featureName,
        "status": status,
        "description": description,
        "sub_feature": List<dynamic>.from(subFeature.map((x) => x.toJson())),
      };
}

class SubFeature {
  final int subFeatureId;
  final int featureId;
  final String subFeature;
  final int subPrice;
  final int subDay;
  final String status;

  SubFeature({
    required this.subFeatureId,
    required this.featureId,
    required this.subFeature,
    required this.subPrice,
    required this.subDay,
    required this.status,
  });

  factory SubFeature.fromJson(Map<String, dynamic> json) => SubFeature(
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

class ProductCategory {
  final int categoryId;
  final Categories categories;

  ProductCategory({
    required this.categoryId,
    required this.categories,
  });

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      ProductCategory(
        categoryId: json["category_id"],
        categories: Categories.fromJson(json["categories"]),
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "categories": categories.toJson(),
      };
}

class Categories {
  final int categoryId;
  final String categoryName;
  final String categoryImage;
  final int status;
  final List<dynamic> subCategories;

  Categories({
    required this.categoryId,
    required this.categoryName,
    required this.categoryImage,
    required this.status,
    required this.subCategories,
  });

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        categoryImage: json["category_image"],
        status: json["status"],
        subCategories: List<dynamic>.from(json["sub_categories"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "category_name": categoryName,
        "category_image": categoryImage,
        "status": status,
        "sub_categories": List<dynamic>.from(subCategories.map((x) => x)),
      };
}
