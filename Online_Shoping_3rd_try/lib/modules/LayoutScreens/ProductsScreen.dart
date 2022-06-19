import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shoping_3rd_try/Network/Remote/dioo_helper.dart';
import 'package:online_shoping_3rd_try/layout/cubit/cubit.dart';
import 'package:online_shoping_3rd_try/layout/cubit/states.dart';
import 'package:online_shoping_3rd_try/models/ProductModel.dart';
import 'package:online_shoping_3rd_try/modules/Details_Screen/details_screen.dart';

import '../../Network/end_point.dart';
import '../../componants/components.dart';
import '../../componants/constans.dart';
import '../../componants/variables.dart';
import '../../models/productdetailsmodel.dart';

class ProductsScreen extends StatelessWidget {

  String? detailsimage;

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<ShopCubit,ShopState>(
        listener: (context, state) {},
        builder: (context,state)
        {
          return ConditionalBuilderRec(
              condition: ProductList != null,
              builder:(context)=> ProductsBuilder2(ProductList,context),
              fallback:(context) => Center(child: CircularProgressIndicator())
          );
        }
    );
  }

  Widget ProductsBuilder2( ProductList,context ) =>
      SingleChildScrollView(
        child: Column(children: [
          GridView.count(crossAxisCount: 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            mainAxisSpacing: 1.0,
            crossAxisSpacing: 1.0,
            childAspectRatio: 1 / 1.58,
            children: List.generate(
                ProductList!.length,
                    (index) => InkWell(
                      onTap: ()
                      {
                        // navigateTo(context,DetailsScreen(productid=ProductList[index]!.id  ));
                        //print(productid);
                        DioHelperr.getData(url: productsdetails,
                                  query: {
                                    "Id":ProductList[index]!.id
                                  }).then((value)
                              {
                                //print(value.toString());
                                productdetailsmodel=Productdetailsmodel.fromJson(value!.data);
                                detailsimage = productdetailsmodel!.image.toString();
                                print(detailsimage);
                                print (productdetailsmodel.toString());

                              }).catchError((error){
                                print(error.toString());});
                        navigateTo(context, DetailsScreen(detailsimage));

                      },
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              alignment: AlignmentDirectional.bottomStart,
                              children: [
                                Image(
                                    image: NetworkImage(ProductList[index]!.image.toString()),
                                  width: double.infinity,
                                  height: 200.0,
                                ),
                                if(ProductList[index]!.discount !=0)
                                  Container(
                                    color: Colors.red,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5.0,
                                    ),
                                    child: Text('DISCOUNT',
                                      style: TextStyle(
                                        fontSize: 8.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      ProductList[index]!.name.toString(),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      height: 1.3,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text((ProductList[index]!.cost-((ProductList[index]!.discount/100)*ProductList[index]!.cost)).toStringAsFixed(2),
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          color: Colors.blue,
                                      )),
                                      SizedBox(width:5.0 ,),
                                      if(ProductList[index]!.discount != 0)
                                          Text(ProductList[index]!.cost.toString(),
                                          style: TextStyle(
                                            fontSize: 10.0,
                                            color: Colors.grey,
                                            decoration: TextDecoration.lineThrough,
                                          ),
                                        ),
                                      Spacer(),
                                      IconButton(onPressed: ()
                                      {
                                        ShopCubit.get(context).changeFav(
                                            userId=2,
                                            productId=ProductList[index].id,
                                            productName=ProductList[index].name.toString(),
                                            productImage=ProductList[index].image.toString(),
                                            productDiscount=ProductList[index].discount.toString(),
                                            productCost=ProductList[index].cost.toString(),
                                            producCount=ProductList[index].count.toString(),
                                            is_Cart=false,
                                            );
                                      },
                                        icon: CircleAvatar(
                                        radius: 15.0,
                                        backgroundColor: (ProductList[index].inFav == true)? Colors.red: Colors.grey,
                                        child: Icon(
                                          Icons.favorite_border,
                                          size: 14.0,
                                          color: Colors.white,
                                        ),
                                      ),)

                                    ],
                                  )

                                ],),
                            )
                          ],
                        ),
                      ),
                    )),
          )
        ],),
      );
}
