// To parse this JSON data, do
//
//     final userCartModel = userCartModelFromJson(jsonString);

import 'dart:convert';

List<UserCartModel> userCartModelFromJson(String str) =>
    List<UserCartModel>.from(json.decode(str).map((x) => UserCartModel.fromJson(x)));

String userCartModelToJson(List<UserCartModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserCartModel {
  UserCartModel({
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

  factory UserCartModel.fromJson(Map<String, dynamic> json) => UserCartModel(
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
