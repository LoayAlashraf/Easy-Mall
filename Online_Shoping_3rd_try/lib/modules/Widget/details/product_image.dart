import 'package:flutter/material.dart';

import '../../../componants/constans.dart';



class ProductImage extends StatelessWidget {
  const ProductImage({
    Key? key,
    required this.size, required this.image,
  }) : super(key: key);

  final Size size;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultpadding),
      height: size.width * 0.8,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: size.width * 0.7,
            width: size.width * 0.7,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          Image.asset(image,
            height: size.width * 0.75,
            width: size.width * 0.75,
            fit: BoxFit.cover,

          ),
        ],
      ),
    );
  }
}
