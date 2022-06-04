import 'package:flutter/material.dart';

import '../../componants/constans.dart';
import '../../models/product.dart';
import '../Buy_conform_screen/Buy_conform_screen.dart';
import '../Widget/Chossen_Product/Chossen_Product.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Cart'),),
      body: Column(

        children: [
          Expanded(
            child: Stack(
              children: [
                SizedBox(
                  height: kDefaultpadding / 2,
                ),
                Container(
                  margin: EdgeInsets.only(top: 70.0),
                  decoration: BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                ),
                ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) => CardChoosen(
                    itemIndex: index,
                    product: products[index],
                    press: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => DetailsScreen(
                      //       product: products[index],

                      //     ),
                      //   ),
                      // );
                    },
                  ),
                ),

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: Row(
              children: [

                Text('Subtotal :',
                  style: TextStyle(
                    fontWeight:FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                Expanded(
                  child: Text('3900.00',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontWeight:FontWeight.w400,
                      fontSize: 20.0,

                    ),

                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: Row(
              children: [

                Text('Shipping Fee :',
                  style: TextStyle(
                    fontWeight:FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                Expanded(
                  child: Text('00.00',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontWeight:FontWeight.w400,
                      fontSize: 20.0,

                    ),

                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: Row(
              children: [

                Text('Discount :',
                  style: TextStyle(
                    fontWeight:FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                Expanded(
                  child: Text('00.00',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontWeight:FontWeight.w400,
                      fontSize: 20.0,

                    ),

                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: Row(
              children: [

                Text('Total :',
                  style: TextStyle(
                    fontWeight:FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                Expanded(
                  child: Text('3900.00',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontWeight:FontWeight.w400,
                      fontSize: 20.0,

                    ),

                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter coupon code',
              ),
            ),

          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  onPressed: (){},
                  color: Colors.blue,
                  child: Text('APPLY',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              width: double.infinity,
              child: MaterialButton(
                onPressed: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BuyConformScreen()));
                },
                color: Colors.blue,
                child: Text('Continue',
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




    );
  }
}
