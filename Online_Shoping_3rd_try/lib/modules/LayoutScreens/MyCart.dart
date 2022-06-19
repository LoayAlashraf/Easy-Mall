import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../componants/components.dart';
import '../../componants/constans.dart';
import '../../componants/items_number.dart';
import '../../componants/variables.dart';
import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/states.dart';
import '../Buy_conform_screen/Buy_conform_screen.dart';

class MyCartScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    CartModelByUserIdList.clear();
    MediaQueryData size = MediaQuery.of(context);
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) =>
          ShopCubit()
            ..GetCartdatabyuserid())
        ],
        child: BlocConsumer<ShopCubit, ShopState>(
          listener: (context, state) {},
          builder: (context, state) {
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
                          itemCount: CartModelByUserIdList.length,
                          itemBuilder: (context, index) =>
                              InkWell(
                                onTap: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) =>
                                  //         DetailsScreen(
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
                                                    CartModelByUserIdList[index].productImage.toString(),
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
                                                      CartModelByUserIdList[index].productName.toString(),
                                                      style: Theme.of(context).textTheme.bodyText1,
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.symmetric(
                                                        horizontal: kDefaultpadding * 1.2, //30 px padding
                                                        vertical: kDefaultpadding / 5, // 5 px padding
                                                      ),
                                                      child:
                                                      Center(child: Text('Price = ${CartModelByUserIdList[index].productCost.toString()}')),
                                                    ),





                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [

                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                                child: ItemsNumber(),
                                              ),
                                              Spacer(),
                                              icontext(
                                                  Textt: 'Remove',
                                                  icon: Icons.remove_shopping_cart,
                                                  onTap: ()
                                                  {
                                                    // DioHelperr.postData(
                                                    //   url: DeleteFromFavByProductId,
                                                    //   query:
                                                    //   {
                                                    //     "id": FavModelByUserIdList[index].productId
                                                    //
                                                    //   },
                                                    // );
                                                  }),
                                              SizedBox(width: 7,),
                                              // icontext(
                                              //     Textt: 'Add to wish list',
                                              //     icon: Icons.favorite,
                                              //     onTap: () {}),


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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: Row(
                      children: [

                        Text('Subtotal :',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        Expanded(
                          child: Text('3900.00',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
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
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        Expanded(
                          child: Text('00.00',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
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
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        Expanded(
                          child: Text('00.00',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
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
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        Expanded(
                          child: Text('3900.00',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
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
                          onPressed: () {},
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
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => BuyConformScreen()));
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
          },
        )
    );
  }
}
