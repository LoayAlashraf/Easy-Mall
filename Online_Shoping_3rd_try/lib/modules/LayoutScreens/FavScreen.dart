import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shoping_3rd_try/Network/Remote/dioo_helper.dart';

import '../../Network/end_point.dart';
import '../../componants/components.dart';
import '../../componants/constans.dart';
import '../../componants/variables.dart';
import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/states.dart';
import '../../models/product.dart';
import '../Widget/My_Wish_Product/My_Wish_Product.dart';

class FavScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    FavModelByUserIdList.clear();
    MediaQueryData size = MediaQuery.of(context);
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context)=>ShopCubit()..getfavdatabyuserid())
    ],
      child: BlocConsumer<ShopCubit,ShopState>(
        listener: (context, state) {},
        builder: (context,state){
          return Scaffold(
            body: ConditionalBuilderRec(
                condition: FavModelByUserIdList != null,
                builder:(context)=> FavWidget(FavModelByUserIdList,context,size),
                fallback:(context) => Center(child: CircularProgressIndicator())
      ),
          );
          },
      )
    );

  }
  Widget FavWidget(FavModelByUserIdList,context,size) => Column(

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
              itemCount: FavModelByUserIdList.length,
              itemBuilder: (context, index) =>
                  InkWell(
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
                                      child: Image.network(
                                        '${FavModelByUserIdList[index].productImage}',
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
                                          FavModelByUserIdList[index].productName.toString(),
                                          style: Theme.of(context).textTheme.bodyText1,
                                        ),

                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: kDefaultpadding * 1.2, //30 px padding
                                            vertical: kDefaultpadding / 5, // 5 px padding
                                          ),
                                          child:
                                          Center(child: Text(FavModelByUserIdList[index].productCost.toString())),
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
                                      onTap: ()
                                      {
                                        //print('productid = ${FavModelByUserIdList[index].productId}');
                                        DioHelperr.postData(
                                          url: DeleteFromFavByProductId,
                                          query:
                                          {
                                            "id": FavModelByUserIdList[index].productId

                                          },
                                        );
                                      }),
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


                  ),
            ),
          ],
        ),
      ),
    ],
  );
}
