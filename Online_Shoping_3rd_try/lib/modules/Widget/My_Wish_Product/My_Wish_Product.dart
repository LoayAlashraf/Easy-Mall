

import 'package:flutter/material.dart';

import '../../../componants/components.dart';
import '../../../componants/constans.dart';
import '../../../models/product.dart';
import '../../Details_Screen/details_screen.dart';

class MyWishProduct extends StatelessWidget {
  const MyWishProduct({
    Key? key,
    required this.itemIndex,
    required this.product,
    required this.press,
  }) : super(key: key);
  final int itemIndex;
  final Product product;
  final Function press;
  @override
  Widget build(BuildContext context) {
    MediaQueryData size = MediaQuery.of(context);
    var caption2 = Theme.of(context).textTheme.caption;

    return InkWell(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => DetailsScreen(
        //       product: products[itemIndex],
        //     ),
        //   ),
        // );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
        child: Container(
          height: size.size.height * .26,
          width: size.size.width * .8,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 15),
                blurRadius: 25,
                color: Colors.black12,
              ),
            ],
          ),
          child: Column(
              children : [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: SizedBox(
                        height: size.size.height * .2,
                        width: size.size.width * .25,
                        child: Image.asset(
                          product.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            product.title,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          Text(
                            product.subTitle,
                            style: caption2,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: kDefaultpadding * 1.2, //30 px padding
                              vertical: kDefaultpadding / 5, // 5 px padding
                            ),
                            child:
                            Center(child: Text('السعر:\$${product.price}')),
                          ),





                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    icontext(
                        Textt: 'Remove',
                        icon: Icons.remove_shopping_cart,
                        onTap: () {}),
                    SizedBox(width: 7,),
                    icontext(
                        Textt: 'Add to My Cart',
                        icon: Icons.add_shopping_cart,
                        onTap: () {}),
                    SizedBox(width: 7,)


                  ],
                ),
              ]
          ),

        ),
      ),


    );
  }
}