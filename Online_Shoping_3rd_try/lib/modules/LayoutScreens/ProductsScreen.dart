import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shoping_3rd_try/layout/cubit/cubit.dart';
import 'package:online_shoping_3rd_try/layout/cubit/states.dart';
import 'package:online_shoping_3rd_try/models/ProductModel.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopState>(
        listener: (context, state) {},
        builder: (context,state)
        {
          return ConditionalBuilderRec(
              condition: ShopCubit.get(context).productModelJson != null,
              builder:(context)=> ProductsBuilder(ShopCubit.get(context).productModelJson),
              fallback:(context) => Center(child: CircularProgressIndicator())
          );
        }
    );
  }
  Widget ProductsBuilder(ProductModelJson? model) => Column(
    children: [
      GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        mainAxisSpacing: 30.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 1/1.5,
        children:
          List.generate(8,
              // model?.length,
                (index) => InkWell(
                  onTap: (){},
                  child: Container(
                    width: 80,
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 40.0,
                          backgroundImage: NetworkImage(model!.image![index]),
                          backgroundColor: Colors.white,
                          ),
                          SizedBox(
                              height:8.0),
                          Text(
                            'phone',
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0 ,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                '2500',
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0 ,
                                    color: Colors.black54
                                ),
                              ),
                              Text(
                                'EGP',
                                maxLines: 2,
                                textAlign: TextAlign.center,


                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 9.0 ,
                                    color: Colors.black54
                                ),
                              ),
                            ],

                          ),



                        ],
                      ),
                    ),
                  ),
          ),
      ),
      ],
  );
}
