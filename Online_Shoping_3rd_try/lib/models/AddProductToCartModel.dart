// To parse this JSON data, do
//
//     final addProductToCartModel = addProductToCartModelFromJson(jsonString);

import 'dart:convert';

AddProductToCartModel addProductToCartModelFromJson(String str) => AddProductToCartModel.fromJson(json.decode(str));

String addProductToCartModelToJson(AddProductToCartModel data) => json.encode(data.toJson());

class AddProductToCartModel {
  AddProductToCartModel({
    this.id,
    this.userId,
    this.productId,
    this.productName,
    this.productImage,
    this.productDiscount,
    this.productCost,
    this.producCount,
  });

  int? id;
  int? userId;
  int? productId;
  String? productName;
  String? productImage;
  String? productDiscount;
  String? productCost;
  String? producCount;

  factory AddProductToCartModel.fromJson(Map<String, dynamic> json) => AddProductToCartModel(
    id: json["id"],
    userId: json["userId"],
    productId: json["productId"],
    productName: json["productName"],
    productImage: json["productImage"],
    productDiscount: json["productDiscount"],
    productCost: json["productCost"],
    producCount: json["producCount"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "productId": productId,
    "productName": productName,
    "productImage": productImage,
    "productDiscount": productDiscount,
    "productCost": productCost,
    "producCount": producCount,
  };
}
