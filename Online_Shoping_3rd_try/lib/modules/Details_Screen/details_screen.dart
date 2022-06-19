import 'package:flutter/material.dart';
import '../../componants/constans.dart';
import '../../componants/variables.dart';
import '../Widget/details/product_image.dart';


class DetailsScreen extends StatelessWidget {


   // ProductModelJson product=new ProductModelJson();
   //
   // DetailsScreen(@required int? index)
   // {
   //
   //   product=ProductList[index!];
   // }
  DetailsScreen(@required detailsimage)
  {

  }

  @override
  Widget build(BuildContext context) {
              return Scaffold(
                  backgroundColor: kPrimaryColor,
                  appBar: detailsAppBar(context),
                  body:SingleChildScrollView(
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
                                  size: MediaQuery.of(context).size,
                                  image: detailsimage.toString(),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: kDefaultpadding / 2,),
                                child: Text('productdetailsmodel.name',
                                  style: Theme.of(context).textTheme.headline6 ,),
                              ),
                              Text("price"" "
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

                          child: Text('productdetailsmodel.description',
                            style: TextStyle(color: Colors.white,
                              fontSize: 19.0,),
                          ),
                        ),
                      ],
                    ),
                  )
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



