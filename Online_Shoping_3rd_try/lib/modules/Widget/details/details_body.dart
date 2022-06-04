import 'package:flutter/material.dart';
import 'package:online_shoping_3rd_try/modules/Widget/details/product_image.dart';
import '../../../componants/constans.dart';
import '../../../models/product.dart';
import 'color_dot.dart';

class DetailsBody extends StatelessWidget {
  final Product product;

  const DetailsBody({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // to provide us the height & the width of the screen
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultpadding * 1.5,
            ),
            decoration: BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ProductImage(
                    size: size,
                    image: product.image,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: kDefaultpadding,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ColorDot(
                        fillColor:kTextLightColor,
                        isSelected: true,
                      ),
                      ColorDot(
                          fillColor: Colors.blue,
                          isSelected: false
                      ),
                      ColorDot(
                        fillColor: Colors.red,
                        isSelected: false,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: kDefaultpadding / 2,),
                  child: Text(product.title,
                    style: Theme.of(context).textTheme.headline6 ,),
                ),
                Text("price""  ${product.price}"
                  //   'السعر:\$${product.price}'
                  ,
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w600,
                    color: kSecoundryColor,
                  ),
                ),
                SizedBox(height: kDefaultpadding,),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: kDefaultpadding / 2,),
            padding: EdgeInsets.symmetric(horizontal: kDefaultpadding*1.5, vertical: kDefaultpadding/2,),

            child: Text(product.description,
              style: TextStyle(color: Colors.white,
                fontSize: 19.0,),
            ),
          ),
        ],
      ),
    );
  }
}


