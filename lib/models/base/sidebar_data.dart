// To parse this JSON data, do
//
//     final baseSidebarModel = baseSidebarModelFromJson(jsonString);

import 'dart:convert';

BaseSidebarModel baseSidebarModelFromJson(String str) =>
    BaseSidebarModel.fromJson(json.decode(str));

String baseSidebarModelToJson(BaseSidebarModel data) =>
    json.encode(data.toJson());

class BaseSidebarModel {
  final String message;
  final List<Datum> data;
  final int status;

  BaseSidebarModel({
    required this.message,
    required this.data,
    required this.status,
  });

  factory BaseSidebarModel.fromJson(Map<String, dynamic> json) =>
      BaseSidebarModel(
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
  final String categoryName;
  final String categoryImage;
  final int status;
  final List<SubCategory> subCategories;

  Datum({
    required this.categoryId,
    required this.categoryName,
    required this.categoryImage,
    required this.status,
    required this.subCategories,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        categoryImage: json["category_image"],
        status: json["status"],
        subCategories: List<SubCategory>.from(
            json["sub_categories"].map((x) => SubCategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "category_name": categoryName,
        "category_image": categoryImage,
        "status": status,
        "sub_categories":
            List<dynamic>.from(subCategories.map((x) => x.toJson())),
      };
}

class SubCategory {
  final int subCategoryId;
  final int categroyId;
  final String subCategory;
  final String image;
  final int status;

  SubCategory({
    required this.subCategoryId,
    required this.categroyId,
    required this.subCategory,
    required this.image,
    required this.status,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        subCategoryId: json["sub_category id"],
        categroyId: json["categroy_id"],
        subCategory: json["sub_category"],
        image: json["image"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "sub_category id": subCategoryId,
        "categroy_id": categroyId,
        "sub_category": subCategory,
        "image": image,
        "status": status,
      };
}
