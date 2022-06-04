import 'package:flutter/material.dart';

import '../../componants/constans.dart';
import '../../models/product.dart';
import '../Widget/details/details_body.dart';


class DetailsScreen extends StatelessWidget {

  final Product product;

  const DetailsScreen({Key? key, required this.product}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: detailsAppBar(context),
      body: DetailsBody(
        product: product,
      ),
    );
  }

  AppBar detailsAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kBackgroundColor,
      elevation: 0,
      leading: IconButton(
        padding: EdgeInsets.only(right: kDefaultpadding),
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,),
        onPressed: () {
          Navigator.pop(context);
        } ,
      ),
      centerTitle: false,
      title: Text('Return',
        style :Theme.of(context).textTheme.bodyText2,),
    );
  }
}