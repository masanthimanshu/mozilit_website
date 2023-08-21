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
  final String discountType;
  final String coverImage;
  final String productImage;
  final dynamic productCategory;
  final List<dynamic> productSubCategory;
  final List<Feaature> feaature;
  final List<dynamic> subFeaature;
  final dynamic productDesignDuration;
  final dynamic productProfessinalPrototype;
  final int productMvpDuration;
  final dynamic productBuildDuration;
  final dynamic productPlatform;
  final String productRoadmap;
  final String productCustomStatus;
  final int status;

  Datum({
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
        discountType: json["discount_type"],
        coverImage: json["cover_image"],
        productImage: json["product_image"],
        productCategory: json["product_category"],
        productSubCategory:
            List<dynamic>.from(json["product_sub_category"].map((x) => x)),
        feaature: List<Feaature>.from(
            json["feaature"].map((x) => Feaature.fromJson(x))),
        subFeaature: List<dynamic>.from(json["sub_feaature"].map((x) => x)),
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
        "discount_type": discountType,
        "cover_image": coverImage,
        "product_image": productImage,
        "product_category": productCategory,
        "product_sub_category":
            List<dynamic>.from(productSubCategory.map((x) => x)),
        "feaature": List<dynamic>.from(feaature.map((x) => x.toJson())),
        "sub_feaature": List<dynamic>.from(subFeaature.map((x) => x)),
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

class Feaature {
  final int categoryId;
  final dynamic featureName;
  final String status;
  final String description;
  final String subFeaature;

  Feaature({
    required this.categoryId,
    required this.featureName,
    required this.status,
    required this.description,
    required this.subFeaature,
  });

  factory Feaature.fromJson(Map<String, dynamic> json) => Feaature(
        categoryId: json["category_id"],
        featureName: json["feature_name"],
        status: json["status"],
        description: json["description"],
        subFeaature: json["sub_feaature"],
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "feature_name": featureName,
        "status": status,
        "description": description,
        "sub_feaature": subFeaature,
      };
}

class ProductCategoryElement {
  final int categoryId;
  final dynamic categoryName;
  final String categoryImage;
  final String status;
  final String subCategories;

  ProductCategoryElement({
    required this.categoryId,
    required this.categoryName,
    required this.categoryImage,
    required this.status,
    required this.subCategories,
  });

  factory ProductCategoryElement.fromJson(Map<String, dynamic> json) =>
      ProductCategoryElement(
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        categoryImage: json["category_image"],
        status: json["status"],
        subCategories: json["sub_categories"],
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "category_name": categoryName,
        "category_image": categoryImage,
        "status": status,
        "sub_categories": subCategories,
      };
}

class ProductPlatformElement {
  final int id;
  final int platformId;
  final int itemId;
  final int userId;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final PlatformName platformName;

  ProductPlatformElement({
    required this.id,
    required this.platformId,
    required this.itemId,
    required this.userId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.platformName,
  });

  factory ProductPlatformElement.fromJson(Map<String, dynamic> json) =>
      ProductPlatformElement(
        id: json["id"],
        platformId: json["platform_id"],
        itemId: json["item_id"],
        userId: json["user_id"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        platformName: PlatformName.fromJson(json["platform_name"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "platform_id": platformId,
        "item_id": itemId,
        "user_id": userId,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "platform_name": platformName.toJson(),
      };
}

class PlatformName {
  final int id;
  final String name;
  final String image;
  final String commission;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  PlatformName({
    required this.id,
    required this.name,
    required this.image,
    required this.commission,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PlatformName.fromJson(Map<String, dynamic> json) => PlatformName(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        commission: json["Commission"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "Commission": commission,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
