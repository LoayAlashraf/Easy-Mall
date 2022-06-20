import 'package:flutter/material.dart';
import 'package:online_shoping_3rd_try/modules/Address_Screen/Address_Screen.dart';
import 'package:online_shoping_3rd_try/modules/LayoutScreens/MyCart.dart';

import '../../componants/components.dart';
import 'FavScreen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              CircleAvatar(
                radius: 70.0,
                backgroundImage: AssetImage('images/jjjj.png'),
                backgroundColor: Colors.white,
              ),
              SizedBox(height: 20,),
              defaultButton(
                  text: 'Account Settings',
                  function: () {  }),
              SizedBox(height: 20,),
              defaultButton(
                  text: 'My Cart',
                  function: ()
                  {
                    navigateTo(context, MyCartScreen());
                  }),

              SizedBox(height: 20,),
              defaultButton(
                  text: 'Address',
                  function: ()
                  {
                    navigateTo(context, AddressScreen());
                  }),
              SizedBox(height: 20,),
              defaultButton(
                  text: 'LogOut',
                  function: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
