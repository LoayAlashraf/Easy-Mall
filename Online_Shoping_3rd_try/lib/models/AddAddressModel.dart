// To parse this JSON data, do
//
//     final addAddressModel = addAddressModelFromJson(jsonString);

import 'dart:convert';

AddAddressModel addAddressModelFromJson(String str) => AddAddressModel.fromJson(json.decode(str));

String addAddressModelToJson(AddAddressModel data) => json.encode(data.toJson());

class AddAddressModel {
  AddAddressModel({
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

  factory AddAddressModel.fromJson(Map<String, dynamic> json) => AddAddressModel(
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
