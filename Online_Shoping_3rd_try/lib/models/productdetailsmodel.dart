// To parse this JSON data, do
//
//     final productdetailsmodel = productdetailsmodelFromJson(jsonString);

import 'dart:convert';

Productdetailsmodel productdetailsmodelFromJson(String str) => Productdetailsmodel.fromJson(json.decode(str));

String productdetailsmodelToJson(Productdetailsmodel data) => json.encode(data.toJson());

class Productdetailsmodel {
  Productdetailsmodel({
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
    this.inFav,
    this.inCart,
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
  bool? inFav;
  bool? inCart;

  factory Productdetailsmodel.fromJson(Map<String, dynamic> json) => Productdetailsmodel(
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
    inFav: json["in_Fav"],
    inCart: json["in_Cart"],
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
    "in_Fav": inFav,
    "in_Cart": inCart,
  };
}
