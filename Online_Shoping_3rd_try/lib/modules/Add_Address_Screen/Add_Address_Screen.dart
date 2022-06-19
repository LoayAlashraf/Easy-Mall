import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_shoping_3rd_try/Network/Remote/dioo_helper.dart';
import 'package:online_shoping_3rd_try/modules/Address_Screen/Address_Screen.dart';

import '../../Network/end_point.dart';

class AddAddressScreen extends StatelessWidget
{
  final double longitude;
  final double latitude;
  final String address;
  AddAddressScreen({
    required this.longitude,
    required this.latitude,
    required this.address,
});

  var LocationController = TextEditingController();
  var AddressController = TextEditingController();
  var LabelController = TextEditingController();
  var StreetName = TextEditingController();
  var BuildingNumber = TextEditingController();
  var FloorNumber = TextEditingController();
  var ApartmentNumber = TextEditingController();
  var MobileNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Address'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                  'Location',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                enabled: false,
                decoration: InputDecoration(
                  hintText: '${latitude} ${longitude}',
                ),
                controller: LocationController,
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                  'Address'
                ,style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                enabled: false,
                decoration: InputDecoration(
                  hintText: '${address}',
                ),
                controller: AddressController,
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Label'
                ,style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Home/Work/....',
                ),
                controller: LabelController,
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                  'Street Name'
                ,style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Street Name',
                ),
                controller: StreetName,
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Building Number'
                ,style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Building name/number',
                ),
                controller: BuildingNumber,
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Floor Number'
                ,style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Floor number',
                ),
                controller: FloorNumber,
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Apartment Number'
                ,style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Apartment number',
                ),
                  controller: ApartmentNumber,
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Mobile Number'
                ,style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Mobile Number',
                ),
                controller: MobileNumber,
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                child: MaterialButton (
                  onPressed: ()
                  async {
                    DioHelperr.postData(
                        url: AddressAdd,
                        data:
                        {
                          "userId": 2,
                          "location": '${latitude} ${longitude}',
                          "myAddress": '${address}',
                          "label": LabelController.text.toString(),
                          "streetName": StreetName.text.toString(),
                          "buildingNumber": BuildingNumber.text.toString(),
                          "floorNumber": FloorNumber.text.toString(),
                          "apartmentNumber": ApartmentNumber.text.toString(),
                          "mobileNumber": MobileNumber.text.toString(),
                        }
                        ).then((value) {print('AdreessHasBeenAddSucsesfully');}).catchError((error){print(error.toString());});
                    await DioHelperr.GetAddress();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AddressScreen()));
                  },
                  color: Colors.blue,
                  child: Text('Add',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),





          ],
        ),
      ),
    );
  }
}
