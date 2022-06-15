// To parse this JSON data, do
//
//     final addressModel = addressModelFromJson(jsonString);

import 'dart:convert';

List<AddressModel> addressModelFromJson(String str) =>
    List<AddressModel>.from(json.decode(str).map((x) => AddressModel.fromJson(x)));

String addressModelToJson(List<AddressModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AddressModel {
  AddressModel({
    this.id,
    this.userId,
    this.location,
    this.myAddress,
    this.label,
    this.streetName,
    this.buildingNumber,
    this.floorNumber,
    this.apartmentNumber,
    this.mobileNumber,
  });

  int? id;
  int? userId;
  String? location;
  String? myAddress;
  String? label;
  String? streetName;
  String? buildingNumber;
  String? floorNumber;
  String? apartmentNumber;
  String? mobileNumber;

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
    id: json["id"],
    userId: json["userId"],
    location: json["location"],
    myAddress: json["myAddress"],
    label: json["label"],
    streetName: json["streetName"],
    buildingNumber: json["buildingNumber"],
    floorNumber: json["floorNumber"],
    apartmentNumber: json["apartmentNumber"],
    mobileNumber: json["mobileNumber"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "location": location,
    "myAddress": myAddress,
    "label": label,
    "streetName": streetName,
    "buildingNumber": buildingNumber,
    "floorNumber": floorNumber,
    "apartmentNumber": apartmentNumber,
    "mobileNumber": mobileNumber,
  };
}
