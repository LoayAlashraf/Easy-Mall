// To parse this JSON data, do
//
//     final productModelJson = productModelJsonFromJson(jsonString);

import 'dart:convert';

List<ProductModelJson> productModelJsonFromJson(String str) =>
    List<ProductModelJson>.from(json.decode(str).map((x) => ProductModelJson.fromJson(x)));

String productModelJsonToJson(List<ProductModelJson> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModelJson {
  ProductModelJson({
    this.id,
    this.name,
    this.cost,
    this.discount,
    this.image,
    this.rfidCode,
    this.description,
    this.category,
    this.idCategory,
    this.prand,
    this.count,
    this.sellername,
  });

  int? id;
  String? name;
  int? cost;
  int? discount;
  String? image;
  String? rfidCode;
  String? description;
  String? category;
  int? idCategory;
  String? prand;
  int? count;
  String? sellername;

  factory ProductModelJson.fromJson(Map<String, dynamic> json) => ProductModelJson(
    id: json["id"],
    name: json["name"],
    cost: json["cost"],
    discount: json["discount"],
    image: json["image"],
    rfidCode: json["rfidCode"],
    description: json["description"],
    category: json["category"],
    idCategory: json["idCategory"],
    prand: json["prand"],
    count: json["count"],
    sellername: json["sellername"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "cost": cost,
    "discount": discount,
    "image": image,
    "rfidCode": rfidCode,
    "description": description,
    "category": category,
    "idCategory": idCategory,
    "prand": prand,
    "count": count,
    "sellername": sellername,
  };
}
