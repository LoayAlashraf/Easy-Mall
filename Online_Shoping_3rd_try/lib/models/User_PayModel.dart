// To parse this JSON data, do
//
//     final userPayModel = userPayModelFromJson(jsonString);

import 'dart:convert';

List<UserPayModel> userPayModelFromJson(String str) =>
    List<UserPayModel>.from(json.decode(str).map((x) => UserPayModel.fromJson(x)));

String userPayModelToJson(List<UserPayModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserPayModel {
  UserPayModel({
    this.id,
    this.userId,
    this.typeOfPay,
    this.number,
    this.expired,
    this.time,
    this.isPayed,
  });

  int? id;
  int? userId;
  String? typeOfPay;
  int? number;
  String? expired;
  String? time;
  bool? isPayed;

  factory UserPayModel.fromJson(Map<String, dynamic> json) => UserPayModel(
    id: json["id"],
    userId: json["userId"],
    typeOfPay: json["typeOfPay"],
    number: json["number"],
    expired: json["expired"],
    time: json["time"],
    isPayed: json["is_Payed"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "typeOfPay": typeOfPay,
    "number": number,
    "expired": expired,
    "time": time,
    "is_Payed": isPayed,
  };
}
