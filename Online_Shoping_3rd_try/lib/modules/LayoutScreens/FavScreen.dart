import 'package:flutter/material.dart';

import '../../componants/constans.dart';
import '../../models/product.dart';
import '../Widget/My_Wish_Product/My_Wish_Product.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  itemBuilder: (context, index) => MyWishProduct(
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


        ],
      ),




    );
  }
}
