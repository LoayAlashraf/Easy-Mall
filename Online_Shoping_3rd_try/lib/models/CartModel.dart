// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

List<CartModel> cartModelFromJson(String str) =>
    List<CartModel>.from(json.decode(str).map((x) => CartModel.fromJson(x)));

String cartModelToJson(List<CartModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartModel {
  CartModel({
    this.id,
    this.userId,
    this.productId,
    this.productImage,
    this.productDiscount,
    this.productCost,
    this.producCount,
  });

  int? id;
  int? userId;
  int? productId;
  String? productImage;
  String? productDiscount;
  String? productCost;
  String? producCount;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    id: json["id"],
    userId: json["userId"],
    productId: json["productId"],
    productImage: json["productImage"],
    productDiscount: json["productDiscount"],
    productCost: json["productCost"],
    producCount: json["producCount"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "productId": productId,
    "productImage": productImage,
    "productDiscount": productDiscount,
    "productCost": productCost,
    "producCount": producCount,
  };
}
