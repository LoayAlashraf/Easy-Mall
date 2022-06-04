class AddAddress_list {
  final double longitude,latitude;
  final int FloorNumber,ApartmentNumber,MobileNumber;
  final String address,label,StreetName,BuildingNumber;

  AddAddress_list({
    required this.longitude,
    required this.latitude,
    required this.FloorNumber,
    required this.ApartmentNumber,
    required this.MobileNumber,
    required this.address,
    required this.label,
    required this.StreetName,
    required this.BuildingNumber, });
}

// list of products
List<AddAddress_list> Address = [
  AddAddress_list(
    ApartmentNumber: 2,
    BuildingNumber: '17',
    address: 'Egypt,المحلة - طلخا، جوجر، طلخا، الدقهلية،، Gogar',
    longitude:31.361062377691265,
    latitude: 31.064965209059604,
    label: 'Home',
    MobileNumber: 01020248452,
    StreetName: 'Al Aeman Street',
    FloorNumber: 6 ,
  ),
  AddAddress_list(
    ApartmentNumber: 2,
    BuildingNumber: '17',
    address: 'Egypt,المحلة - طلخا، جوجر، طلخا، الدقهلية،، Gogar',
    longitude:31.361062377691265,
    latitude: 31.064965209059604,
    label: 'Work',
    MobileNumber: 01020248452,
    StreetName: 'Al Aeman Street',
    FloorNumber: 6 ,
  ),

];