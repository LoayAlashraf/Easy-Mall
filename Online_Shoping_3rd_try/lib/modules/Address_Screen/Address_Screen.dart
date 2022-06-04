import 'package:flutter/material.dart';
import 'package:online_shoping_3rd_try/modules/Google_Map_Screen/Google_Map_Screen.dart';

import '../../models/address_list.dart';
import '../Widget/Address.dart';


class AddressScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    MediaQueryData size = MediaQuery.of(context);
    var caption2 = Theme.of(context).textTheme.caption;
    return Scaffold(
      appBar: AppBar(
        title: Text('Address'),
        actions: [
          MaterialButton(onPressed: ()
          {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Google_map_Screen()));
          },
          child: Text('Add',style: TextStyle(color: Colors.white),),)
        ],
      ),
      body: Column(
        children: [

          Expanded(
            child: ListView.builder(
                itemCount: Address.length,
                itemBuilder: (context, index) => Addresswidget(address: Address[index],),
            ),
          ),
        ],
      ),
    );
  }
}
