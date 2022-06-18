import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shoping_3rd_try/Network/Remote/dio_helper.dart';
import 'package:online_shoping_3rd_try/models/ProductModel.dart';
import 'package:online_shoping_3rd_try/models/productdetailsmodel.dart';

import '../../Network/Remote/dioo_helper.dart';
import '../../Network/end_point.dart';
import '../../componants/constans.dart';
import '../../componants/variables.dart';
import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/states.dart';
import '../../models/product.dart';
import '../Widget/details/color_dot.dart';
import '../Widget/details/details_body.dart';
import '../Widget/details/product_image.dart';


class DetailsScreen extends StatelessWidget {


   // ProductModelJson product=new ProductModelJson();
   //
   // DetailsScreen(@required int? index)
   // {
   //
   //   product=ProductList[index!];
   // }
  DetailsScreen(productid){}

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
      create: (BuildContext context)=>ShopCubit()..getproductdetailsdata(productid),)
    ],
        child:BlocConsumer<ShopCubit,ShopState>(
            listener: (context, state) {},
            builder: (context,state){
              return Scaffold(
                  backgroundColor: kPrimaryColor,
                  appBar: detailsAppBar(context),
                  body:ConditionalBuilderRec(
                    condition: false,
                    builder:(context)=> detailsbody(productdetailsmodel,context),
                    fallback:(context) => Center(child: CircularProgressIndicator())
                  ),
              );
            }
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
Widget detailsbody(context,productdetailsmodel) => SingleChildScrollView(
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
                    image: 'https://z.nooncdn.com/products/v1613148237/N43080201V_1.jpg',
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(vertical: kDefaultpadding,),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       ColorDot(
                //         fillColor:kTextLightColor,
                //         isSelected: true,
                //       ),
                //       ColorDot(
                //           fillColor: Colors.blue,
                //           isSelected: false
                //       ),
                //       ColorDot(
                //         fillColor: Colors.red,
                //         isSelected: false,
                //       ),
                //     ],
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: kDefaultpadding / 2,),
                  child: Text(productdetailsmodel.name,
                    style: Theme.of(context).textTheme.headline6 ,),
                ),
                Text("price""  ${productdetailsmodel.cost}"
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

            child: Text(productdetailsmodel.description,
              style: TextStyle(color: Colors.white,
                fontSize: 19.0,),
            ),
          ),
        ],
      ),
    );



