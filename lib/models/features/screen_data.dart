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
  final List<Datum> data;
  final int status;

  FeatureScreenModel({
    required this.message,
    required this.data,
    required this.status,
  });

  factory FeatureScreenModel.fromJson(Map<String, dynamic> json) =>
      FeatureScreenModel(
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
  final int discount;
  final List<ProductCategory> productCategory;
  final List<dynamic> productSubCategory;
  final List<Feaature> feaature;
  final List<dynamic> subFeaature;
  final int status;

  Datum({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.discountType,
    required this.coverImage,
    required this.productImage,
    required this.discount,
    required this.productCategory,
    required this.productSubCategory,
    required this.feaature,
    required this.subFeaature,
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
        discount: json["discount"],
        productCategory: List<ProductCategory>.from(
            json["product_category"].map((x) => ProductCategory.fromJson(x))),
        productSubCategory:
            List<dynamic>.from(json["product_sub_category"].map((x) => x)),
        feaature: List<Feaature>.from(
            json["feaature"].map((x) => Feaature.fromJson(x))),
        subFeaature: List<dynamic>.from(json["sub_feaature"].map((x) => x)),
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
        "discount": discount,
        "product_category":
            List<dynamic>.from(productCategory.map((x) => x.toJson())),
        "product_sub_category":
            List<dynamic>.from(productSubCategory.map((x) => x)),
        "feaature": List<dynamic>.from(feaature.map((x) => x.toJson())),
        "sub_feaature": List<dynamic>.from(subFeaature.map((x) => x)),
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
    this.featureName,
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

class ProductCategory {
  final int categoryId;
  final dynamic categoryName;
  final String categoryImage;
  final String status;
  final String subCategories;

  ProductCategory({
    required this.categoryId,
    this.categoryName,
    required this.categoryImage,
    required this.status,
    required this.subCategories,
  });

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      ProductCategory(
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
